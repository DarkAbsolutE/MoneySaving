module ApplicationHelper

  def build_button_class(object)
    if object.status
      "glyphicon glyphicon-pencil btn ac btn-default"
    else
      "glyphicon glyphicon-pencil btn in btn-default"
    end
  end

  def build_status_class(employee)
    employee.status ? "info" : "danger"
  end
end
