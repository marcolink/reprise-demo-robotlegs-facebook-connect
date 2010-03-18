package app
{
	import app.view.ApplicationView;
	import app.events.InitialDataServiceEvent;
	import reprise.core.Application;

	[Frame(factoryClass="app.view.Preloader")]
	public class FacebookConnectApp extends Application
	{
		/*******************************************************************************************
		*									public properties							       	   *
		*******************************************************************************************/
		public static const CSS_URL : String = 'style/flash.css';


		/*******************************************************************************************
		*								protected/ private properties							   *
		*******************************************************************************************/
		private var m_context : FacebookConnectContext;

		
		/*******************************************************************************************
		*								public methods											   *
		*******************************************************************************************/
		override protected function startApplication() : void
		{
			addEventListener(InitialDataServiceEvent.DATA_LOADED, initialData_loaded);	
			m_context = new FacebookConnectContext(m_rootElement);
		}

		private function initialData_loaded(event : InitialDataServiceEvent) : void 
		{
			createApplicationView();
		}

		private function createApplicationView() : void 
		{
			ApplicationView(m_rootElement.addChild(new ApplicationView()));
		}
	}
}