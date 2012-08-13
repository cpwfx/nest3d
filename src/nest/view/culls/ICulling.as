package nest.view.culls 
{
	import nest.object.IContainer3D;
	import nest.object.IMesh;
	
	/**
	 * ICulling
	 */
	public interface ICulling {
		
		function classifyMesh(mesh:IMesh):Boolean;
		
		function classifyContainer(container:IContainer3D):Boolean;
		
		function doMesh(mesh:IMesh):void;
		
		function get customize():Boolean;
		
	}
	
}