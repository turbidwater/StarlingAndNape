package com.starling.sample
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class ParticleTest extends Sprite
	{
		[Embed("../assets/well.jpg")]
		public var portalBackground:Class;
		
		public function ParticleTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _initBackground():void
		{
			var background:Image = Image.fromBitmap( new portalBackground() );
			addChild( background );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			_initBackground();
			
			//165, 125
		}
	}
}