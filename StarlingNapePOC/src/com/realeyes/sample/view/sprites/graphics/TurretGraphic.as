package com.realeyes.sample.view.sprites.graphics
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class TurretGraphic extends Sprite
	{
		[Embed(source="assets/turret.png")]
		private var _graphic:Class;	

		public function TurretGraphic()
		{
			addChild( Image.fromBitmap( new _graphic() ) );
			pivotX = (width >> 1) - 3; //Not sure why, but we have to offset this a little
			pivotY = height >> 1;
		}
	}
}