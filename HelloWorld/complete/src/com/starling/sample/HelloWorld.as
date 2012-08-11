package com.starling.sample
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class HelloWorld extends Sprite
	{
		[Embed('../assets/StarlingLogo.png')]
		public var imageSrc:Class;
		
		public function HelloWorld()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			addChild( Image.fromBitmap( new imageSrc() ) );
		}
	}
}