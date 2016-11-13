package pl.edu.pw.okno.page;

import com.codename1.components.SpanLabel;
import com.codename1.io.Log;
import com.codename1.ui.*;
import com.codename1.ui.events.ActionEvent;
import com.codename1.ui.layouts.BorderLayout;
import com.codename1.ui.plaf.UIManager;
import pl.edu.pw.okno.resource.Subject;
import pl.edu.pw.okno.resource.SubjectInfoDto;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

import java.io.InputStream;

public class SubjectPage extends AbsPage {


	static private final String TITLE = "nazwa przedmiotu";
	static private final String OWNER = "prowadzący";
	static private final String OBJECTIVES = "cel";
	static private final String DESCRIPTION = "opis";
	static private final String BIBLIOGRAPHY = "bibliografia";

	public static final String INFORMATION = "Informacja";
	public static final String WARNING = "Ostrzeżenie";
	public static final String OPERATION_SUCCESS = "Operacja zakończona powodzeniem";
	public static final String OPERATION_WRITE_FAILED = "Nie można dokonać zapisu na przedmiot";
	public static final String OK = "OK";
	public static final String CANCEL = "Anuluj";

	private final String uri;
	private SubjectInfoDto subjectInfo;
	
	private final SpanLabel title;
	private final SpanLabel owner;
	private final SpanLabel objectives;
	private final SpanLabel description;
	private final SpanLabel bibliography;
	
	public SubjectPage(String title, String uri) {
		super(new Form(title));
		
		this.uri = uri;
		this.title = new SpanLabel("Unknown");
		this.owner = new SpanLabel("Unknown");
		this.objectives = new SpanLabel("Unknown");
		this.description = new SpanLabel("Unknown");
		this.bibliography = new SpanLabel("Unknown");
	}
	
	protected void setContent() {
		fetchData();
		setLayout();
		addSubjectFields();
        addEditFields();
	}
	
	private SubjectInfoDto fetchData() {
		Subject subject = new Subject(Properties.getInstance().getUrl(), uri);
		try {
        	subject.requestFor();
        	subjectInfo = subject.getResults();
        	updateFields();
        } catch(Exception ex) {
        	ex.printStackTrace();
        }
		return subjectInfo;
	}
	
	private void setLayout() {
		BorderLayout layout = new BorderLayout();
		getPage().setLayout(layout);
        layout.setCenterBehavior(BorderLayout.CENTER_BEHAVIOR_CENTER);
	}
	
	private void addEditFields() {
		Image img = FontImage.createMaterial(FontImage.MATERIAL_MODE_EDIT, UIManager.getInstance().getComponentStyle("Command"));
		if (subjectInfo.isAvailable()) {
			Command edit = new Command("Zapisz się", img) {
        	
	            @Override
	            public void actionPerformed(ActionEvent evt) {
	                Log.p("Zapisano", Log.INFO);
	                AbsRequestHandler save = new AbsRequestHandler() {
						
	                	@Override
						protected void verify(int code, String message) {
							// TODO Auto-generated method stub
						}
						
						@Override
						protected void read(InputStream input) {
						}
						
						@Override
						protected void parse() {
						}
						
						@Override
						public void requestFor() {
							setUrl(Properties.getInstance().getUrl() + uri);
							setPutMethod();
							showUIProgress();
							sendRequest();
						}
						
						@Override
						public Object getResults() {
							return null;
						}
					};
					
					save.requestFor();
					if (save.getResponseCode() == 201) {
						Dialog.show(INFORMATION, OPERATION_SUCCESS, OK, CANCEL);
					} else {
						Dialog.show(WARNING, OPERATION_WRITE_FAILED, OK, CANCEL);
					}
	            }
	            
	        };
	        
	        getPage().getToolbar().addCommandToOverflowMenu(edit);
		}
	}
	
	private void addSubjectFields() {
		ComponentGroup userGroup = new ComponentGroup();
        userGroup.addComponent(new Label(TITLE));
        userGroup.addComponent(title);
        userGroup.addComponent(new Label(OWNER));
        userGroup.addComponent(owner);
        userGroup.addComponent(new Label(OBJECTIVES));
        userGroup.addComponent(objectives);
        userGroup.addComponent(new Label(DESCRIPTION));
        userGroup.addComponent(description);
        userGroup.addComponent(new Label(BIBLIOGRAPHY));
        userGroup.addComponent(bibliography);
        userGroup.setScrollableY(true);
        
        getPage().addComponent(BorderLayout.CENTER, userGroup);
	}
	
	private void updateFields() {
		title.setText(subjectInfo.getTitle());
		owner.setText(subjectInfo.getOwner());
		objectives.setText(subjectInfo.getObjectives());
		description.setText(subjectInfo.getDescription());
		bibliography.setText(subjectInfo.getBibliography());
	}
	
}
