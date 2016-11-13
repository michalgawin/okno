package pl.edu.pw.okno.page;

import com.codename1.ui.*;
import com.codename1.ui.layouts.BorderLayout;
import com.codename1.ui.layouts.BoxLayout;
import com.codename1.ui.layouts.FlowLayout;
import com.codename1.ui.layouts.LayeredLayout;
import com.codename1.ui.plaf.DefaultLookAndFeel;
import com.codename1.ui.plaf.Style;
import com.codename1.ui.plaf.UIManager;
import pl.edu.pw.okno.resource.Department;
import pl.edu.pw.okno.resource.DepartmentDto;

import java.util.ArrayList;
import java.util.List;

public class DepartmentsPage extends AbsPage {

	private static final DepartmentsPage INSTANCE = new DepartmentsPage();
	
	private Department department = null;
	
	public static DepartmentsPage getInstance() {
		return INSTANCE;
	}
	
	private DepartmentsPage() {
		super(new Form("Ogłoszenia kierunkowe", new BoxLayout(BoxLayout.Y_AXIS)));
		department = new Department(Properties.getInstance().getUrl());
	}
	
	@Override
	protected void setContent() {
		getPage().setTitle("Ogłoszenia kierunkowe");
		List<DepartmentDto> departments = new ArrayList<>();
		department.requestFor();
		departments = department.getResults();
		setData(departments);
	}
	
	private void setData(List<DepartmentDto> entries) {
		LayeredLayout layout = new LayeredLayout();
		getPage().setLayout(layout);
		
		Tabs tabs = new Tabs();
		tabs.hideTabs();
		
		Style s = UIManager.getInstance().getComponentStyle("Button");
		
		FontImage radioEmpty = FontImage.createMaterial(FontImage.MATERIAL_RADIO_BUTTON_UNCHECKED, s);
		FontImage radioFull = FontImage.createMaterial(FontImage.MATERIAL_RADIO_BUTTON_CHECKED, s);
		((DefaultLookAndFeel)UIManager.getInstance().getLookAndFeel()).setRadioButtonImages(radioEmpty, radioFull);
		
		for (DepartmentDto dto : entries) {
			SpecificPublicationPage page = new SpecificPublicationPage(dto);
			page.hide();
			page.show();
			tabs.addTab(dto.getDepartmentName(), page.getPage());
		}
		
		List<RadioButton> radioButtonList = new ArrayList<>();
		ButtonGroup group = new ButtonGroup();
		Container tabsFlow = FlowLayout.encloseCenter();
		for (int i = 0; i < tabs.getTabCount(); i++) {
			RadioButton radioButton = new RadioButton();
			radioButton.setUIID("Container");
			radioButton.setSelected(false);
			group.add(radioButton);
			tabsFlow.addComponent(radioButton);
			radioButtonList.add(radioButton);
		}
		radioButtonList.get(0).setSelected(true);
		
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
