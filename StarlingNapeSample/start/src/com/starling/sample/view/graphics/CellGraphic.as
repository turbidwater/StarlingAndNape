package com.starling.sample.view.graphics
{
	import com.starling.sample.textures.TextureManager;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class CellGraphic extends Sprite
	{
		
		
		public var textureAtlas:TextureAtlas;
		public var frames:Vector.<Texture>;
		public var clip:MovieClip;
		
		public function CellGraphic()
		{
			super();
			
			var textureManager:TextureManager = TextureManager.getInstance();
			var frames:Vector.<Texture> = textureManager.getTextureObject( TextureManager.CELL ) as Vector.<Texture>;
			
			clip = new MovieClip(frames, 30);
			
			addChild( clip );
			
			Starling.juggler.add( clip );
			
			pivotX = width >> 1;
			pivotY = height >> 1;
		}
		
		
	}
}