package com.realeyes.sample.game
{
	import com.realeyes.sample.events.DebugOverlayEvent;
	import com.realeyes.sample.model.constants.CallbackTypes;
	import com.realeyes.sample.view.sprites.Shot;
	import com.realeyes.sample.view.sprites.Target;
	import com.realeyes.sample.view.sprites.Turret;
	import com.realeyes.sample.view.sprites.graphics.TurretGraphic;
	
	import flash.events.MouseEvent;
	import flash.ui.KeyLocation;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	import nape.callbacks.CbEvent;
	import nape.callbacks.InteractionCallback;
	import nape.callbacks.InteractionListener;
	import nape.callbacks.InteractionType;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyList;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class Game extends Sprite
	{
		//===============================================================
		//	PROPERTY DECLARATIONS
		//===============================================================
		public var space:Space;
		public var turret:Turret;
		public var border:Body;
		public var starling:Starling;
		private var _renderSurface:BitmapDebug;
		
		
		//===============================================================
		//	INIT METHODS
		//===============================================================
		public function Game()
		{
			addEventListener( Event.ADDED_TO_STAGE, _initSample );
		}
		
		private function _initSample( event:Event ):void
		{
			_renderSurface = new BitmapDebug( stage.stageWidth, stage.stageHeight, 0x000000, true );
			
			space = new Space( new Vec2( 0, 0 ) );
			space.worldLinearDrag = 1;
			space.worldAngularDrag = 5;
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, _onKeyDown );
			
			_initBorders();
			_initTurret();
			_initTargets();
			
			_initListeners();
			
			this.stage.dispatchEvent( new DebugOverlayEvent( DebugOverlayEvent.DEBUG_OVERLAY_READY, _renderSurface ) );
		}
		
		private function _initBorders():void
		{
			border = new Body( BodyType.STATIC );
			border.shapes.add( new Polygon( Polygon.rect( 0, 0, -50, stage.stageHeight ) ) );
			border.shapes.add( new Polygon( Polygon.rect( stage.stageWidth, 0, 50, stage.stageHeight ) ) );
			border.shapes.add( new Polygon( Polygon.rect( 0, 0, stage.stageWidth, -50 ) ) );
			border.shapes.add( new Polygon( Polygon.rect( 0, stage.stageHeight, stage.stageWidth, 50 ) ) );
			
			border.cbType = CallbackTypes.WALL_CALLBACK;
			
			border.space = space;
		}
		
		private function _initTurret():void
		{
			turret = new Turret( BodyType.DYNAMIC, new Vec2( 250, 250 ) );
			turret.space = space;
			turret.graphicUpdate = updateGraphics;
			
			addChild( turret.graphic );
		}
		
		private function _initTargets():void
		{
			var len:int = Math.floor( Math.random() * 5 ) + 15;
			for( var i:int; i < len; i++ )
			{
				var pos:Vec2 = new Vec2( Math.random() * (stage.stageWidth - 30), Math.random() * (stage.stageHeight - 30) );
				var target:Target = new Target( BodyType.DYNAMIC, pos );
				target.space = space;
				target.graphicUpdate = updateGraphics;
				
				addChild( target.graphic );
			}
		}
		
		private function _initListeners():void
		{
			space.listeners.add( new InteractionListener( CbEvent.BEGIN, InteractionType.COLLISION, CallbackTypes.SHOT_CALLBACK, CallbackTypes.TARGET_CALLBACK, _onTargetShot ) );
			space.listeners.add( new InteractionListener( CbEvent.BEGIN, InteractionType.COLLISION, CallbackTypes.SHOT_CALLBACK, CallbackTypes.WALL_CALLBACK, _onWallShot ) );
			addEventListener( Event.ENTER_FRAME, _onEnterFrame );
		}
		
		
		//===============================================================
		//	CONTROL METHODS
		//===============================================================
		public function step():void
		{
			_renderSurface.clear();
			space.step( 1/60, 10, 10 );
			_renderSurface.draw( space );
			_renderSurface.flush();
		}
		
		private function updateGraphics( body:Body ):void
		{
			body.graphic.x = body.position.x;
			body.graphic.y = body.position.y;
			body.graphic.rotation = body.rotation;
		}
		
		private function _handleShot( shot:Shot ):void
		{
			shot.space = space;
			shot.graphicUpdate = updateGraphics;
			
			addChild( shot.graphic );
		}
		
		
		//===============================================================
		//	EVENT HANDLERS
		//===============================================================
		private function _onEnterFrame( event:Event ):void
		{
			step();
		}
		
		private function _onKeyDown( event:KeyboardEvent ):void
		{
			switch( event.keyCode )
			{
				case Keyboard.LEFT:
				{
					turret.turn( Turret.LEFT );
					break;
				}
				case Keyboard.RIGHT:
				{
					turret.turn( Turret.RIGHT );
					break;
				}
				case Keyboard.UP:
				{
					turret.forward();
					break;
				}
				case Keyboard.DOWN:
				{
					turret.backward();
					break;
				}
				case Keyboard.SPACE:
				{
					_handleShot( turret.fire() );
					break;
				}
			}
		}
		
		private function _onTargetShot( callback:InteractionCallback ):void
		{
			if( callback.int1.isBody() )
			{
				var body1:Body = callback.int1 as Body;
				removeChild( body1.graphic );
				space.bodies.remove( body1 );
			}
			
			if( callback.int2.isBody() )
			{
				var body2:Body = callback.int2 as Body;
				removeChild( body2.graphic );
				space.bodies.remove( body2 );
			}
		}
		
		private function _onWallShot( callback:InteractionCallback ):void
		{
			if( callback.int1.isBody() )
			{
				var body1:Body = callback.int1 as Body;
				removeChild( body1.graphic );
				space.bodies.remove( body1 );
			}
		}
		
		
		//===============================================================
		//	GETTER/SETTERS
		//===============================================================
		public function get renderSurface():BitmapDebug
		{
			return _renderSurface;
		}
	}
}