module Admin::GuidesHelper
  def preview_edition_path(edition)
    preview_edition_prefix_path(edition) + "/#{edition.guide.slug}"
  end

  def progress_button(opts)
    title,guide,edition,activity = opts[:title],opts[:guide],opts[:edition],opts[:activity]
    check_method = "can_#{activity}?".to_sym
    if edition.send(check_method)
      button_to title, progress_admin_guide_path(guide, :activity => activity, :edition_id => edition)
    end
  end
  
  def progress_buttons(guide,edition)
    [
      ["Request review","request_review"],
      ["Reviewed","review"],
      ["Okay","okay"],
      ["Publish","publish"]
    ].map{ |title,activity|
      progress_button(:title=>title,:guide=>guide,:activity=>activity,:edition=>edition)
    }.join("\n").html_safe
  end
end
