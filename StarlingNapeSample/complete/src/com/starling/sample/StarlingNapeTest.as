package com.starling.sample
{
	import com.starling.sample.view.bodies.CellBody;
	import com.starling.sample.view.graphics.CellGraphic;
	import com.starling.sample.view.graphics.GroundGraphic;
	
	import flash.events.MouseEvent;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class StarlingNapeTest extends Sprite
	{
		//===============================================================
		//	PROPERTY DECLARATIONS
		//===============================================================
		public var ground:Body;
		public var space:Space;
		
		
		//===============================================================
		//	INIT METHODS
		//===============================================================
		public function StarlingNapeTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _initSpace():void
		{
			space = new Space( new Vec2( 0, 200 ) );
			
			stage.addEventListener( TouchEvent.TOUCH, _onClick );
		}
		
		private function _initGround():void
		{
			var graphic:GroundGraphic = new GroundGraphic();
			graphic.x = 0;
			graphic.y = stage.stageHeight - graphic.height/2
				
			var groundPos:Vec2 = new Vec2( 0, stage.stageHeight - graphic.height/2 )
			ground = new Body( BodyType.STATIC, groundPos );
			ground.shapes.add( new Polygon( Polygon.rect( 0, 0, graphic.width, graphic.height ) ) );
			ground.graphic = graphic;
			
			ground.space = space;

			addChild( graphic );
		}
		
		
		//===============================================================
		//	CONTROL METHODS
		//===============================================================
		public function step():void
		{
			space.step( 1/60, 10, 10 );
		}
		
		private function _updateGraphics( body:Body ):void
		{
			body.graphic.x = body.position.x;
			body.graphic.y = body.position.y;
			body.graphic.rotation = body.rotation;
		}
		
		private function _createCell( x:Number, y:Number ):void
		{
			var position:Vec2 = new Vec2( x, y );
			var cellBody:CellBody = new CellBody(position);
			cellBody.graphicUpdate = _updateGraphics;
			cellBody.space = space;
			
			addChild( cellBody.graphic );
		}

		
		//===============================================================
		//	EVENT HANDLERS
		//===============================================================
		private function _onAddedToStage( event:Event ):void
		{
			_initSpace();
			_initGround();
			
			addEventListener( Event.ENTER_FRAME, _onEnterFrame );
		}
		
		private function _onEnterFrame( event:Event ):void
		{
			step();
		}
		
		private function _onClick( event:TouchEvent ):void
		{
			var touch:Touch = event.touches[0];
			if( touch.phase == TouchPhase.ENDED )
			{
				_createCell( touch.globalX, touch.globalY );
			}
		}
	}
}