class StaticPagesController < ApplicationController
  def home
  	@user = User.all
  end

  def perfomance_evaluation

    @answers =  PerfomanceAnswer.all

  	@role = Role.all


    #vinculo dos usuários que vão se avaliar

    evaluatedMapHash = {1 => [1,2], 2 => [1,2], 3 => [1,2,3]}

    #recupera os usuários qu ele tem que avaliar
    userId = current_user.id

    #recupera o id dos usuários que ele tem que avaliar
    arrUserIdMaybeEvaluated = evaluatedMapHash[userId]

    @arrUserEvaluated = Array.new

    #recuperando o cargo
    user = User.find(userId);

    #percorre o array de usuários que tenho que avaliar
    arrUserIdMaybeEvaluated.each do |userIdMayBeEvaluated|
      #recupera o usuário que tem que ser avaliado
      user = User.find(userIdMayBeEvaluated)
      #verifica se este usuario é do mesmo tipo que o cargo selecionado
      if user.role_id == user.role_id
        #criando o array dos usuários que devo avaliar
        @arrUserEvaluated.push(user)
      end
    end


    #recuperando a avaliação de desempenho baseado no cargo
    @perfomance = Perfomance.includes(:dimensions).where(role_id: user.role_id).first

    #recuperando as dimensões
    #@dimension = Dimension.where(perfomance_id: @perfomance.id)






  end

  #savando o valor da avaliação de desempenho
  def ajax_perfomance_user_save

    #id do usuário avaliador
    userIdLogged = current_user.id
    #id do usuário avaliado
    userId = params[:ajaxUserId]
    #avaliação de desempenho
    perfomanceId = params[:ajaxPerfomanceId]
    #dimensao
    dimensionId = params[:ajaxDimensionId]
    #questão
    questionId = params[:ajaxQuestionId]
    #valor da pergunta
    value = params[:ajaxValue]
    #feedback
    text = params[:ajaxText]
    

    #verifica se já existe uma resposta para pergunta enviada
    answerExists = nil

    #ele esta enviando um feedback?
    if value == nil
      PerfomanceAnswer.where(
        userLogged_id: userIdLogged,
        user_id: userId,
        perfomance_id: perfomanceId,
        dimension_id: dimensionId, 
        ).first
    else 
      PerfomanceAnswer.where(
        userLogged_id: userIdLogged,
        user_id: userId,
        perfomance_id: perfomanceId,
        dimension_id: dimensionId, 
        question_id: questionId
        ).first
    end

    #criando as variáveis de controle
    createRegistry = false
    updateRegistry = false
    successControl = false
    errorControl   = true

    #existe uma resposta?
    if answerExists == nil
      #criando o registro
      registry = PerfomanceAnswer.create({
        userLogged_id: userIdLogged, 
        user_id: userId, 
        perfomance_id: perfomanceId,
        dimension_id: dimensionId, 
        question_id: questionId, 
        value: value,
        text: text})
      #atualizando as variáveis de controle
      createRegistry = true
      successControl = true
      errorControl   = false
    else
      if value == nil
        answerExists.text = value
      else
        if text == nil
          answerExists.value = value
        end
      end
      #atualizando o registro
      answerExists.save
      #atualizando as variáveis de controle
      updateRegistry = true
      successControl = true
      errorControl   = false
    end
      

    result = {create: createRegistry, update: updateRegistry, registry: registry, success: successControl, error: errorControl}

    render :json => result

  end

  def performance_user

    evaluatedMapHash = {1 => [1,3], 2 => [1,2], 3 => [1,2,3]}

    #recupera os usuários qu ele tem que avaliar
    userId = current_user.id

    #recupera o id dos usuários que ele tem que avaliar
    arrUserIdMaybeEvaluated = evaluatedMapHash[userId]

    #recuperando o cargo
    roleId = Role.find(params[:ajaxRoleId]);

    arrUserEvaluated = Array.new
    
    #percorre o array de usuários que tenho que avaliar
    arrUserIdMaybeEvaluated.each do |userIdMayBeEvaluated|
      #recupera o usuário que tem que ser avaliado
      user = User.find(userIdMayBeEvaluated)
      #verifica se este usuario é do mesmo tipo que o cargo selecionado
      if user.role_id == roleId
        #criando o array dos usuários que devo avaliar
        arrUserEvaluated.push(user)
      end #if user.role_id == roleId
    end #arrUserIdMaybeEvaluated.each do |userIdMayBeEvaluated|


    #recuperando a avaliação de desempenho baseado no cargo
    perfomance = Perfomance.includes(:dimensions).where(role_id: roleId).first

    render :layout => 'blank', :locals => {:arrUserEvaluated => arrUserEvaluated, :role => roleId, :perfomance => perfomance }

  end #performance_user

end #class
