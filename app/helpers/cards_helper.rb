def correct?
  # return params[:card] if params
  @card.guess_correct?(params[:card]['guess'])
end
