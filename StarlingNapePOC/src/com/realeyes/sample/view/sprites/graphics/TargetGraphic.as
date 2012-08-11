package com.realeyes.sample.view.sprites.graphics
{
	import com.realeyes.sample.model.constants.TargetTypes;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class TargetGraphic extends Sprite
	{
		[Embed(source="assets/targetSquare.png")]
		private var _square:Class;	

		[Embed(source="assets/targetPentagon.png")]
		private var _pentagon:Class;	
		
		[Embed(source="assets/targetRect.png")]
		private var _rectangle:Class;	
		
		[Embed(source="assets/targetCircle.png")]
		private var _circle:Class;	

		public function TargetGraphic( type:int )
		{
			switch( type )
			{
				case TargetTypes.SQUARE:
				{
					addChild( Image.fromBitmap( new _square() ) );
					break;
				}
				case TargetTypes.PENTAGON:
				{
					addChild( Image.fromBitmap( new _pentagon() ) );
					break;
				}
				case TargetTypes.RECTANGLE:
				{
					addChild( Image.fromBitmap( new _rectangle() ) );
					break;
				}
				case TargetTypes.CIRCLE:
				{
					addChild( Image.fromBitmap( new _circle() ) );
					break;
				}
			}
			
			pivotX = width >> 1;
			if( type == TargetTypes.PENTAGON )
			{
				pivotX -= 1;
			}
			pivotY = height >> 1;
		}
	}
}