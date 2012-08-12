package com.starling.sample
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ParticleTest extends Sprite
	{
		public function ParticleTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			
		}
	}
}