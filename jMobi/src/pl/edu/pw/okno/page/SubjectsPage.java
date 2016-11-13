package pl.edu.pw.okno.page;

import com.codename1.components.SpanButton;
import com.codename1.components.SpanLabel;
import com.codename1.ui.*;
import com.codename1.ui.layouts.BorderLayout;
import com.codename1.ui.layouts.BoxLayout;
import com.codename1.ui.layouts.FlowLayout;
import com.codename1.ui.layouts.LayeredLayout;
import com.codename1.ui.plaf.DefaultLookAndFeel;
import com.codename1.ui.plaf.Style;
import com.codename1.ui.plaf.UIManager;
import pl.edu.pw.okno.resource.PlanDto;
import pl.edu.pw.okno.resource.SectionDto;
import pl.edu.pw.okno.resource.SubjectDto;
import pl.edu.pw.okno.resource.Subjects;

import java.util.ArrayList;
import java.util.List;

@MenuItem(itemName = "Przedmioty", order = 5)
public class SubjectsPage extends AbsPage {

	private static final SubjectsPage INSTANCE = new SubjectsPage();
	
	public static SubjectsPage getInstance() {
		return INSTANCE;
	}
	
	private SubjectsPage() {
		super(new Form("Przedmioty", new LayeredLayout()));
	}
	
	@Override
	protected void setContent() {
		setData();
	}
	
	private void setData() {
		getPage().setScrollable(false);
		
		Tabs tabs = new Tabs();
		tabs.hideTabs();
		
		Style s = UIManager.getInstance().getComponentStyle("Button");
		
		FontImage radioEmpty = FontImage.createMaterial(FontImage.MATERIAL_RADIO_BUTTON_UNCHECKED, s);
		FontImage radioFull = FontImage.createMaterial(FontImage.MATERIAL_RADIO_BUTTON_CHECKED, s);
		((DefaultLookAndFeel)UIManager.getInstance().getLookAndFeel()).setRadioButtonImages(radioEmpty, radioFull);
		
		Subjects subjects = new Subjects(Properties.getInstance().getUrl());
    	subjects.requestFor();
        
		for(SectionDto section : subjects.getResults().getSections()) {
			Form form = new Form(section.getSectionName(), new BoxLayout(BoxLayout.Y_AXIS));
			
			List<PlanDto> plans = section.getPlans();
			for(PlanDto plan : plans) {
				form.add(new SpanLabel(plan.getPlanName()));
				
				ComponentGroup group = new ComponentGroup();
				for(SubjectDto subject : plan.getSubjects()) {
					SpanButton button = new SpanButton(subject.getSubjectName());
					
					button.addActionListener((e) -> {
						SubjectPage subjectPage = new SubjectPage(subject.getSubjectName(), subject.getUri());
						subjectPage.setBackCommand(this.getPage());
						subjectPage.show();
					});
					
					group.add(button);
				}
				
				form.addComponent(group);
			}
			
			tabs.addTab(section.getSectionName(), form);
		}
		
		List<RadioButton> radioButtonList = new ArrayList<>();
		ButtonGroup group = new ButtonGroup();
		Container tabsFlow = FlowLayout.encloseCenter();
		for (int i = 0; i < tabs.getTabCount(); i++) {
			RadioButton radioButton = new RadioButton("");
			radioButton.setUIID("Container");
			radioButton.setSelected(false);
			group.add(radioButton);
			tabsFlow.addComponent(radioButton);
			radioButtonList.add(radioButton);
		}
		if (radioButtonList.size() > 0) {
			radioButtonList.get(0).setSelected(true);
		}
		
		getPage().add(tabs);
		getPage().add(BorderLayout.south(tabsFlow));
		tabsFlow.repaint();
		
		tabs.addSelectionListener((oldSelected, newSelected) -> {
			if (radioButtonList.get(oldSelected).isSelected()) {
				radioButtonList.get(oldSelected).setSelected(false);
			}
			if (!radioButtonList.get(newSelected).isSelected()) {
				radioButtonList.get(newSelected).setSelected(true);
			}
		});
	}
	
}
