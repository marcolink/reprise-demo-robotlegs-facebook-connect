package app
{
	import app.controller.startup.ConfigCommand;
	import app.controller.startup.PrepControllerCommand;
	import app.controller.startup.PrepModelCommand;
	import app.controller.startup.PrepServicesCommand;
	import app.controller.startup.PrepViewCommand;
	import app.controller.startup.StartupCommand;
	import app.events.InitialDataServiceEvent;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	public class FacebookConnectContext extends Context
	{
		/*******************************************************************************************
		*								public methods											   *
		*******************************************************************************************/
		public function FacebookConnectContext(
			contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, ConfigCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepModelCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepControllerCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepServicesCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);

			eventDispatcher.addEventListener(
					InitialDataServiceEvent.DATA_LOADED, initialData_loaded);
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}


		/*******************************************************************************************
		*								protected/ private methods								   *
		*******************************************************************************************/
		/**
		 * Used to inform the preloader about successful data load
		 * @param event
		 */
		private function initialData_loaded(event : InitialDataServiceEvent) : void
		{
			eventDispatcher.removeEventListener(InitialDataServiceEvent.DATA_LOADED, initialData_loaded);
			contextView.dispatchEvent(event);
		}
	}
}