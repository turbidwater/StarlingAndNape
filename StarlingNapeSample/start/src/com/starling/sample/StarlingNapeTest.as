package com.starling.sample
{
	import com.starling.sample.shape.Cell;
	import com.starling.sample.shape.Ground;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class StarlingNapeTest extends Sprite
	{
		public var ground:Ground;
		
		public function StarlingNapeTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
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
			_initGround();
			addChild( new Cell() );
		}
	}
}