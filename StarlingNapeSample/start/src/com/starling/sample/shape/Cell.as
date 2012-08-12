package com.starling.sample.shape
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Cell extends Sprite
	{
		[Embed(source="../assets/Animation.png")]
		public var spriteSheet:Class;
		
		[Embed(source="../assets/Animation.xml", mimeType="application/octet-stream")]
		public var spriteSheetXML:Class;
		
		public var textureAtlas:TextureAtlas;
		public var frames:Vector.<Texture>;
		public var clip:MovieClip;
		
		public function Cell()
		{
			super();
			
			var texture:Texture = Texture.fromBitmap( new spriteSheet() );
			var textureXML:XML = XML( new spriteSheetXML() );
			textureAtlas = new TextureAtlas( texture, textureXML );
			frames = textureAtlas.getTextures();
			
			clip = new MovieClip(frames, 30);
			
			addChild( clip );
			
			Starling.juggler.add( clip );
		}
		
		
	}
}