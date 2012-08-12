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
			
			//Create and add the shapes that make up this body
			
			//Create and align the graphic
		}
	}
}