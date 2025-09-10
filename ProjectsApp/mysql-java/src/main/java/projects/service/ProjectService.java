/**
 * 
 */
package projects.service;

import java.util.List;
import java.util.NoSuchElementException;
import projects.dao.ProjectDao;
import projects.entity.Project;
import projects.exception.DbException;

/**
 * This class implements the service layer in the 3-tier application. The CRUD operations that the
 * application performs are so simple that this class acts mostly as a pass-through from the input
 * layer to the data layer.
 * 
 * @author Promineo
 *
 */
public class ProjectService {
  private ProjectDao projectDao = new ProjectDao();

  /**
   * This method simply calls the DAO class to insert a project row.
   * 
   * @param project The {@link Project} object.
   * @return The Project object with the newly generated primary key value.
   */
  public Project addProject(Project project) {
    return projectDao.insertProject(project);
  }

  /**
   * This method calls the project DAO to retrieve all project rows without accompanying details
   * (materials, steps and categories).
   * 
   * @return A list of project records.
   */
  public List<Project> fetchAllProjects() {
    return projectDao.fetchAllProjects();
  }

  /**
   * This method calls the project DAO to get all project details, including materials, steps, and
   * categories. If the project ID is invalid, it throws an exception.
   * 
   * @param projectId The project ID.
   * @return A Project object if successful.
   * @throws NoSuchElementException Thrown if the project with the given ID does not exist.
   */
  public Project fetchProjectById(Integer projectId) {
    return projectDao.fetchProjectById(projectId).orElseThrow(() -> new NoSuchElementException(
        "Project with project ID=" + projectId + " does not exist."));
  }

  /**
   * This method calls the project DAO to update project details.
   * 
   * @param project The Project object containing updated details.
   * @throws DbException Thrown if the project does not exist.
   */
  public void modifyProjectDetails(Project project) {
    if(!projectDao.modifyProjectDetails(project)) {
      throw new DbException("Project with ID=" + project.getProjectId() + " does not exist.");
    }
  }

  /**
   * This method calls the project DAO to delete a project.
   * 
   * @param projectId The project ID to delete.
   * @throws DbException Thrown if the project does not exist.
   */
  public void deleteProject(Integer projectId) {
    if(!projectDao.deleteProject(projectId)) {
      throw new DbException("Project with ID=" + projectId + " does not exist.");
    }
  }


}
