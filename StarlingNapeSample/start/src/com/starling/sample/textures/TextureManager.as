package com.starling.sample.textures
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class TextureManager
	{
		public static const CELL:String = 'cell';
		public static const GROUND:String = 'ground';
		
		private static var _instance:TextureManager;
		
		
		[Embed("../assets/ground.png")]
		protected var groundImageSource:Class;
		
		[Embed(source="../assets/Animation.png")]
		protected var spriteSheet:Class;
		
		[Embed(source="../assets/Animation.xml", mimeType="application/octet-stream")]
		protected var spriteSheetXML:Class;
		
		private var _textureDictionary:Dictionary;
		
		public function TextureManager( singletonSentry:SingletonSentry )
		{
			_initTextures();
		}
		
		static public function getInstance():TextureManager
		{
			if( !_instance )
			{
				_instance = new TextureManager( new SingletonSentry() );
			}
			
			return _instance;
		}
		
		private function _initTextures():void
		{
			_textureDictionary = new Dictionary();
			
			_textureDictionary[ CELL ] = _createFrames( new spriteSheet(), XML(new spriteSheetXML()) );
			_textureDictionary[ GROUND ] = Image.fromBitmap( new groundImageSource() );
		}
		
		private function _createFrames( spriteSheet:Bitmap, xml:XML ):Vector.<Texture>
		{
			var texture:Texture = Texture.fromBitmap( spriteSheet );
			var textureAtlas:TextureAtlas = new TextureAtlas( texture, xml );
			var frames:Vector.<Texture> = textureAtlas.getTextures();
			
			return frames;
		}
		
		public function getTextureObject( name:String ):Object
		{
			return _textureDictionary[ name ];
		}
	}
}

class SingletonSentry{}