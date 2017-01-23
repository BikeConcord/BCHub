$(document).ready(function() {
  $("#page-content").html(dom.getTreeHtml(data.tasks));
  dom.setClasses();
  dom.attachEventHandlers();
});

var dom = {
  getTreeHtml: function(treeArray, topItemId) {
    var treeHtml = "<ol id=\"tree\">";
    treeHtml += dom.iterateTreeArray(treeArray, topItemId);    
    treeHtml += "</ol>";
    return treeHtml;
  },
  iterateTreeArray: function(treeArray, topItemId) {
    var treeHtml = "";
    /* Iterate through tree array. */
    $.each(treeArray, function(index, treeItem) {
      if(
          treeItem.task_id == topItemId ||
          typeof topItemId == "undefined"
      ) {
        if(treeItem.hasOwnProperty("task_id")) {
          treeHtml += dom.getTaskHtml(treeItem);
        }
      }
      else {
        treeHtml += dom.iterateTreeArray(treeItem.sub_tasks, topItemId);
      }      
    });
    return treeHtml;
  },
  getTaskHtml: function(task) {
    taskHtml = "";
    taskHtml += "<li class=\""
    if(task.completion_status == 1) {
      taskHtml += "tree-completed-task";
    }
    taskHtml += "\"><a href=\"#\" class=\"tree-collapse-button tree-item-icon\"><span class=\"glyphicon glyphicon-triangle-bottom\" aria-label=\"Collapse\"></span></a><a href=\"#\" class=\"tree-expand-button tree-item-icon\"><span class=\"glyphicon glyphicon-triangle-right\" aria-label=\"Expand\"></span></a><span class=\"tree-completed-task-icon tree-item-icon\"><span class=\"glyphicon glyphicon-ok\" aria-label=\"Completed\"></span></span><span class=\"tree-open-task-icon tree-item-icon\"><span class=\"glyphicon glyphicon-unchecked\" aria-label=\"Open task\"></span></span><a href=\"#\" class=\"tree-task-name-link\"><span class=\"task-name-span\">";
    taskHtml += task.name;
    taskHtml += "</span></a>";
      /* Iterate through subtasks. */
      if(task.sub_tasks.length > 0) {
        taskHtml += "<ol>";
        $.each(task.sub_tasks, function(index, sub_task) {
          taskHtml += dom.getTaskHtml(sub_task);
        });
        taskHtml += "</ol>";
      }
    taskHtml += "</li>";
    //console.log(taskHtml);
    return taskHtml;
  },
  getTableHtml: function() {
  },
  setClasses: function() {
    $("#tree li").not($("#tree li").has("ol")).addClass("tree-bottom-level");
  },
  attachEventHandlers: function() {
    $("#tree .tree-collapse-button").on("click", function(event) {
      event.preventDefault();
      $(this).parent("li").addClass("tree-collapsed");
    });
    $("#tree .tree-expand-button").on("click", function(event) {
      event.preventDefault();
      $(this).parent("li").removeClass("tree-collapsed");
    });
    $(".tree-task-name-link").on("click", function(event) {
      event.preventDefault();
      window.history.pushState("object or string", "Title", "/new-url");
    });
  }
};