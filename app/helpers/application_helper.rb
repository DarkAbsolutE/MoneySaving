module ApplicationHelper

  def build_button_class(edit_employee)
    if edit_employee.status
      "glyphicon glyphicon-remove btn ac btn-default"
    else
      "glyphicon glyphicon-ok btn in btn-default"
    end
  end

  def build_status_class(type_employee)
    type_employee.status ? "info" : "danger"
  end
end
