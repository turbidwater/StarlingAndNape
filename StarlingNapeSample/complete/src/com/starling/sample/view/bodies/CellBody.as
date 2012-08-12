package com.starling.sample.view.bodies
{
	import com.starling.sample.view.graphics.CellGraphic;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Shape;
	
	public class CellBody extends Body
	{
		public function CellBody(position:Vec2)
		{
			super( BodyType.DYNAMIC, position );
			
			var shape:Shape = new Circle( 67 );
			shape.material = Material.rubber();
			shapes.add( shape );
			
			graphic = new CellGraphic();
			
			align();
		}
	}
}