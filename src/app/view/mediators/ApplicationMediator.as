package app.view.mediators
{
	import app.events.URIEvent;
	import app.view.ApplicationView;

	import org.robotlegs.mvcs.Mediator;

	public class ApplicationMediator extends Mediator
	{
		/*******************************************************************************************
		 *								public properties										   *
		 *******************************************************************************************/
		[Inject] public var applicationView : ApplicationView;


		/*******************************************************************************************
		 *								protected/ private properties							   *
		 *******************************************************************************************/


		/*******************************************************************************************
		 *								public methods											   *
		 *******************************************************************************************/
		public function ApplicationMediator()
		{
			super();
		}

		override public function onRegister() : void
		{
			eventMap.mapListener(eventDispatcher, URIEvent.URI_CHANGED, uri_changed);
		}
		

		/*******************************************************************************************
		 *								protected/ private methods							     *
		 *******************************************************************************************/
		private function uri_changed(event : URIEvent) : void 
		{
			
		}
	}
}