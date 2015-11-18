class StaticPagesController < ApplicationController
  def home
  	@user = User.all
  end

  def perfomance_result
    @answers = PerfomanceAnswer.all
    @a = PerfomanceAnswer
      .select("dimension_id, avg(value) as soma")
      .where("value is not null")
      .group("dimension_id")
      .order('dimension_id')

    #select("*,sum(value) as soma").where("value is not null").group(:dimension_id).order("dimension_id")
  end

  def result_equip
    @answers = PerfomanceAnswer.all
  end

  def result_dimension

  end

  def result_area
    
  end


  def perfomance_answer
    @answers = PerfomanceAnswer.all
    @answers.each do |a|
      @users = User.find(a.userLogged)
    end
  end

  def perfomance_evaluation

    @answers =  PerfomanceAnswer.all

  	@role = Role.all


    #vinculo dos usuários que vão se avaliar

    evaluatedMapHash = {29 => [9,29,23,41,32,2,51], 23 => [29,23,41,32,2,51,36,8] , 
      41 => [29,23,41,32,2,51,4,27,13,14,15] , 32 => [29,23,41,32,2,51,38,5], 
      2 => [29,23,41,32,2,51,34,28], 51 => [29,23,41,32,2,51,33] , 
      9 => [9,21,35,49,29], 21 => [9,21,35,49], 
      35 => [9,21,35,49], 49 => [9,21,35,49], 36 => [36,7,17,39,23],
      7 => [36,7,17,39], 17 => [36,7,17,39], 39 => [36,7,17,39], 8 => [8,30,23], 30 => [8,30],
      4 => [4,1,42,43,41], 1 => [4,1,42,43], 42 => [4,1,42,43], 43 => [4,1,42,43],
      27 => [27,10,16,12,46,41], 10 => [27,10,16,12,46], 16 => [27,10,16,12,46], 
      12 => [27,10,16,12,46], 46 => [27,10,16,12,46],
      13 => [13,14,15,41], 14 => [13,14,15,41], 15 => [13,14,15,41], 
      38 => [38,11,19,20,48,32], 11 => [38,11,19,20,48], 
      19 => [38,11,19,20,48], 20 => [38,11,19,20,48], 48 => [38,11,19,20,48], 
      5 => [5,31,37,40,32], 31 => [5,31,37,40],
      37 => [5,31,37,40], 40 => [5,31,37,40], 34 => [34,50,2], 50 => [34,50], 
      28 => [28,6,24,26,45,2], 6 => [28,6,24,26,45], 
      24 => [28,6,24,26,45], 26 => [28,6,24,26,45], 45 => [28,6,24,26,45],
      33 => [33,3,22,44,51,18], 3 => [33,3,22,44,18], 22 => [33,3,22,44,18], 44 => [33,3,22,44,18], 18 => [33,3,22,44,18]}


    #recupera os usuários qu ele tem que avaliar
    userId = current_user.id

    #recupera o id dos usuários que ele tem que avaliar
    arrUserIdMaybeEvaluated = evaluatedMapHash[userId]

    @arrUserEvaluated = Array.new
    perfomanceAnswer = Array.new

    #recuperando o cargo
    #user = User.find(userId)
    roleId = params[:role_id]

    #percorre o array de usuários que tenho que avaliar
    arrUserIdMaybeEvaluated.each do |userIdMayBeEvaluated|
      #recupera o usuário que tem que ser avaliado
      user = User.find(userIdMayBeEvaluated)
      #verifica se este usuario é do mesmo tipo que o cargo selecionado
      if user.role_id.to_i == roleId.to_i
        #criando o array dos usuários que devo avaliar
        @arrUserEvaluated.push(user)
      end
    end

    #criando um hash com as avaliações do usuário
    userPerfomanceAnswer = Hash.new

    #pesquisando todas as avaliações do usuário
    perfomanceAnswer = PerfomanceAnswer.where(userLogged: userId)
    
    perfomanceAnswer.each do |pa|

      if pa.value != nil
        key = "cb_#{pa.user_id}_#{pa.perfomance_id}_#{pa.dimension_id}_#{pa.question_id}"
        userPerfomanceAnswer[key] = pa.value
      else
        if pa.text != nil
          key = "tx_#{pa.user_id}_#{pa.perfomance_id}_#{pa.dimension_id}"
          userPerfomanceAnswer[key] = pa.text
        end
      end


    end 
  

    @userPerfomanceAnswer = userPerfomanceAnswer

    
    @pa = perfomanceAnswer

  


    #recuperando a avaliação de desempenho baseado no cargo
    @perfomance = Perfomance.includes(:dimensions).where(role_id: roleId).first
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
        userLogged: userIdLogged,
        user_id: userId,
        perfomance_id: perfomanceId,
        dimension_id: dimensionId, 
        ).first
    else 
      PerfomanceAnswer.where(
        userLogged: userIdLogged,
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
        userLogged: userIdLogged, 
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

end #class
