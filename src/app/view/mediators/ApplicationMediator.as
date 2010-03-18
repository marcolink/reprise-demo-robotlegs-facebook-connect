package app.view.mediators
{
	import app.events.fb.FBConnectEvent;
	import app.models.fb.FBModel;
	import app.view.ApplicationView;

	import org.robotlegs.mvcs.Mediator;

	public class ApplicationMediator extends Mediator
	{
		/*******************************************************************************************
		 *								public properties										   *
		 *******************************************************************************************/
		[Inject] public var applicationView : ApplicationView;
		[Inject] public var fbModel : FBModel;


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
			eventMap.mapListener(eventDispatcher, FBConnectEvent.FB_CONNECT_SUCCESS, login_success);
		}

		private function login_success(event : FBConnectEvent) : void 
		{
			applicationView.setUserData(fbModel.getUserData());
		}

		
		/*******************************************************************************************
		 *								protected/ private methods							     *
		 *******************************************************************************************/
	}
}