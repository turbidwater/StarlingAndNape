package
{
	import com.starling.sample.ParticleTest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	public class ParticleSample extends Sprite
	{
		public var star:Starling;
		
		public function ParticleSample()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			star = new Starling( ParticleTest, stage );
			star.start();
		}
	}
}