package com.starling.sample.view.graphics
{
	import com.starling.sample.textures.TextureManager;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class GroundGraphic extends Sprite
	{
		public var groundImage:Image;
		
		public function GroundGraphic()
		{
			super();
			
			groundImage = TextureManager.getInstance().getTextureObject( TextureManager.GROUND ) as Image;
			addChild( groundImage );
		}
	}
}