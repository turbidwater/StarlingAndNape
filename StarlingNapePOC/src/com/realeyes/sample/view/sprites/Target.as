package com.realeyes.sample.view.sprites
{
	
	import com.realeyes.sample.model.constants.CallbackTypes;
	import com.realeyes.sample.model.constants.CollisionGroups;
	import com.realeyes.sample.model.constants.TargetTypes;
	import com.realeyes.sample.utils.MathUtils;
	import com.realeyes.sample.view.sprites.graphics.TargetGraphic;
	
	import flash.net.drm.AddToDeviceGroupSetting;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.shape.Shape;
	
	public class Target extends Body
	{
		override public function Target(type:BodyType=null, position:Vec2=null)
		{
			super(type, position);
			
			_initShape();
		}
		
		private function _initShape():void
		{
			var rand:int = Math.round( Math.random() * 3 ) + 1;
			var shape:Shape;
			switch( rand )
			{
				case TargetTypes.SQUARE:
				{
					shape = new Polygon( Polygon.rect( 0, 0, 30, 30 ) );
					break;
				}
				case TargetTypes.PENTAGON:
				{
					shape = new Polygon( Polygon.regular( 30, 30, 5 ) );
					break;
				}
				case TargetTypes.RECTANGLE:
				{
					shape = new Polygon( Polygon.rect( 0, 0, 40, 15 ) );
					break;
				}
				case TargetTypes.CIRCLE:
				{
					shape = new Circle( 15 );
					break;
				}
			}
			
			shape.material = Material.wood();
			
			shapes.add( shape );
			
			graphic = new TargetGraphic( rand );
			
			align();
			
			rotation = MathUtils.toRadians( Math.random() * 360 ); 
			
			group = CollisionGroups.TARGETS_GROUP;
			cbType = CallbackTypes.TARGET_CALLBACK;
		}
	}
}