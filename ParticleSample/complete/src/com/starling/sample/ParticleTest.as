package com.starling.sample
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.ParticleDesignerPS;
	import starling.textures.Texture;
	
	public class ParticleTest extends Sprite
	{
		[Embed("../assets/well.jpg")]
		public var portalBackground:Class;
		
		[Embed("../assets/texture.png")]
		public var portalParticle:Class;
		
		[Embed(source="../assets/particle.pex", mimeType="application/octet-stream")]
		public var portalXML:Class;
		
		public var particleSystem:ParticleDesignerPS;
		
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
		
		private function _initParticles():void
		{
			var texture:Texture = Texture.fromBitmap( new portalParticle() );
			var xml:XML = XML( new portalXML() );
			
			particleSystem = new ParticleDesignerPS( xml, texture );
			particleSystem.x = 165;
			particleSystem.y = 125;
			
			particleSystem.start();
			
			addChild( particleSystem );
			Starling.juggler.add( particleSystem );
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			_initBackground();
			_initParticles();
		}
	}
}