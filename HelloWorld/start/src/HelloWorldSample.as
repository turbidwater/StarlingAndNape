package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	[SWF(width="350", height="350", frameRate="60")]
	public class HelloWorldSample extends Sprite
	{
		[Embed('../assets/StarlingLogo.png')]
		public var imageSrc:Class;
		public var bitmap:Bitmap;
		
		public function HelloWorldSample()
		{
			bitmap = new imageSrc();
			addChild( bitmap );
		}
	}
}