package
{
	import com.starling.sample.JugglerTest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	public class JugglerSample extends Sprite
	{
		public var star:Starling;
		
		public function JugglerSample()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			star = new Starling( JugglerTest, stage );
			
			star.start();
		}
	}
}