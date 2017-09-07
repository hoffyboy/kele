module Roadmap
  def get_roadmap(roadmap_id = @user["current_enrollment"]["roadmap_id"])
    url = "https://www.bloc.io/api/v1/roadmaps/#{roadmap_id}"
    response = self.class.get(url, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    url = "https://www.bloc.io/api/v1/checkpoints/#{checkpoint_id}"
    response = self.class.get(url, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def create_submission(checkpoint_id, assignment_branch = nil, assignment_commit_link = nil, comment = nil)
    values = {
      "checkpoint_id": checkpoint_id,
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "comment": comment,
      "enrollment_id": @user["current_enrollment"]["id"],
    }

    url = "https://www.bloc.io/api/v1/checkpoint_submissions"
    response = self.class.post(url, body: values, headers: { "authorization" => @auth_token })
  end

  def update_submission(id, checkpoint_id, assignment_branch = nil, assignment_commit_link = nil, comment = nil)
    values = {
      "checkpoint_id": checkpoint_id,
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "comment": comment,
      "enrollment_id": @user["current_enrollment"]["id"],
    }

    url = "https://www.bloc.io/api/v1/checkpoint_submissions/#{id}"
    response = self.class.put(url, body: values, headers: { "authorization" => @auth_token })
  end
end
