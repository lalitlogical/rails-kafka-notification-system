class CommentsController < ApplicationController
  def create
    # Dummy comment event
    KafkaNotifier.publish("comment_events", {
      ticket_id: 123,
      comment_id: 456,
      user_id: params[:user_id] || 49,
      content: "This is a comment!"
    })

    render json: { status: "Event published" }
  end
end
