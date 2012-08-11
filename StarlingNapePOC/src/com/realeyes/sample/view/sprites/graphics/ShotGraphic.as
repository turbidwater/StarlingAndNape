package com.realeyes.sample.view.sprites.graphics
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class ShotGraphic extends Sprite
	{
		[Embed(source="assets/shot.png")]
		private var _graphic:Class;
		
		public function ShotGraphic()
		{
			addChild( Image.fromBitmap( new _graphic() ) );
			
			pivotX = width >> 1;
			pivotY = height >> 1;
		}
	}
}