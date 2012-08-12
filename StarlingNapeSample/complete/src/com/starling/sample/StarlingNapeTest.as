package com.starling.sample
{
	import com.starling.sample.shape.Cell;
	import com.starling.sample.shape.Ground;
	
	import flash.events.MouseEvent;
	
	import nape.geom.Vec2;
	import nape.space.Space;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class StarlingNapeTest extends Sprite
	{
		public var ground:Ground;
		public var space:Space;
		
		public function StarlingNapeTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _initSpace():void
		{
			space = new Space( new Vec2( 15, 0 ) );
			
			stage.addEventListener( TouchEvent.TOUCH, _onClick );
		}
		
		private function _initGround():void
		{
			ground = new Ground();
			ground.x = 0;
			ground.y = stage.stageHeight - ground.height / 2;
			
			addChild( ground );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			_initSpace();
			_initGround();
			addChild( new Cell() );
		}
		
		private function _onClick( event:TouchEvent ):void
		{
			var cell:Cell = new Cell();
			var touch:Touch = event.touches[0];
			if( touch.phase == TouchPhase.ENDED )
			{
				cell.x = touch.globalX;
				cell.y = touch.globalY;
				addChild( cell );
				trace('lb');
			}
		}
	}
}