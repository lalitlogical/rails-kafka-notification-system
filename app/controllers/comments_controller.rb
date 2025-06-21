class CommentsController < ApplicationController
  def create
    KafkaNotifier.publish("comment_events", {
      event_id: comment_params[:event_id] || SecureRandom.uuid,
      ticket_id: comment_params[:ticket_id] || 123,
      comment_id: comment_params[:comment_id] || 456,
      user_id: comment_params[:user_id] || 49,
      content: comment_params[:content] || "This is a comment!",
      audience: comment_params[:audience] || [ 42, 99 ]
    })

    render json: { status: "Event published" }
  end

  def comment_params
    params.require(:comment).permit(:event_id, :ticket_id, :comment_id, :user_id, :content, audience: [])
  end
end
