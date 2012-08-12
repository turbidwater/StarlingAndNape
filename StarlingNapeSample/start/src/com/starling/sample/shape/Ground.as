package com.starling.sample.shape
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Ground extends Sprite
	{
		[Embed("../assets/ground.png")]
		public var groundImageSource:Class;
		
		public var groundImage:Image;
		
		public function Ground()
		{
			super();
			
			groundImage = Image.fromBitmap( new groundImageSource() );
			addChild( groundImage );
		}
	}
}