package
{
	import com.starling.sample.JugglerTest;
	
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	public class JugglerSample extends Sprite
	{
		var star:Starling;
		
		public function JugglerSample()
		{
			star = new Starling( JugglerTest, stage );
		}
	}
}