package
{
	import com.starling.sample.HelloWorld;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(width="350", height="350", frameRate="60")]
	public class HelloWorldSample extends Sprite
	{
		/*
		[Embed('../assets/StarlingLogo.png')]
		public var imageSrc:Class;
		public var bitmap:Bitmap;
		*/
		public var star:Starling;
		
		public function HelloWorldSample()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			//bitmap = new imageSrc();
			//addChild( bitmap );
			star = new Starling( HelloWorld, stage );
			star.start();
		}
	}
}