package
{
	import com.starling.sample.StarlingNapeTest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(width="720", height="640", frameRate="60", backgroundColor="#AE6060")]
	public class StarlingNapeSample extends Sprite
	{
		public var star:Starling;
		
		public function StarlingNapeSample()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			star = new Starling( StarlingNapeTest, stage );
			star.start();
		}
	}
}