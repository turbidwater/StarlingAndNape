package com.starling.sample
{
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class JugglerTest extends Sprite
	{
		
		[Embed(source="../assets/Animation.png")]
		public var spriteSheet:Class;
		
		[Embed(source="../assets/Animation.xml", mimeType="application/octet-stream")]
		public var spriteSheetXML:Class;
		
		public var textureAtlas:TextureAtlas;
		public var frames:Vector.<Texture>;
		public var clip:MovieClip;
		
		public function JugglerTest()
		{
			super();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _animate():void
		{
			clip = new MovieClip(frames, 30);
			
			addChild( clip );
			
			Starling.juggler.add( clip );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			var texture:Texture = Texture.fromBitmap( new spriteSheet() );
			var textureXML:XML = XML( new spriteSheetXML() );
			textureAtlas = new TextureAtlas( texture, textureXML );
			frames = textureAtlas.getTextures();
			
			_animate();
		}
	}
}