User.create(
  email: 'b.ourognao@gmail.com',
  uid: 'b.ourognao@gmail.com',
  password: 'omoroi2018',
  name: 'Bago',
  kind: :engineer,
  status: :active,
  line: 'bago25',
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)
User.create(
  email: 'george@gmail.com',
  uid: 'george@gmail.com',
  password: 'omoroi2018',
  name: 'George',
  kind: :admin,
  status: :active,
  line: 'fishgutts',
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)
User.create(
  email: 'maki@hotmail.fr',
  uid: 'maki@hotmail.fr',
  password: 'omoroi2018',
  name: 'Maki',
  kind: :organizer,
  status: :active,
  line: 'maki369',
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)
User.create(
  email: 'chikako@hotmail.fr',
  uid: 'chikako@hotmail.fr',
  password: 'omoroi2018',
  name: 'Chikako',
  kind: :organizer,
  status: :active,
  line: 'chikako333',
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)
User.create(
  email: 'sakamoto@hotmail.fr',
  uid: 'sakamoto@hotmail.fr',
  password: 'omoroi2018',
  name: 'Sakamoto',
  kind: :customer,
  status: :active,
  last_sign_in_ip: ENV['OFFICE_IP_ADDRESS'],
  last_sign_in_at: Time.current,
  confirmed_at: Time.current
)

def createEvents(maxEvents, isFuturEvents)
  for i in 0..maxEvents
    sectionItems = ['SC', 'LX', 'SP']
    section = sectionItems.sample
    sportTagsItemsJp = ['バレーボール', 'バスケットボール', '卓球', 'フットサル', 'バドミントン', 'キックボクシング', 'テニス', 'その他']
    sportTagsItemsEn = ['volleyball', 'basketball', 'pingpong', 'futsal', 'badminton', 'kickboxing', 'tennis', 'other']
    tagJp = section == 'SP' ? sportTagsItemsJp.sample : nil
    tagEn = section == 'SP' ? sportTagsItemsEn.sample : nil
    locationItemsJP = ['スポーツセンター', '体操クラブ']
    locationItemsEn = ['Sports Center', 'Gymnastic Club']
    townItemsJP = ['三島郡', '豊能町', '泉北郡', '泉南市', '吹田市', '堺市', '高槻市', '池田市', '貝塚市']
    townItemsEN = ['Mishima', 'Toyono', 'Senboku', 'Sennan', 'Suita', 'Sakai', 'Takatsuki', 'Ikeda', 'Kaizuka']
    townJP = townItemsJP.sample
    townEn = townItemsEN.sample
    positionItems = [ 
      Mishima: [35.11840249999999, 138.91851259999999],
      Toyono: [34.9189477,135.49417360000007],
      Senboku: [39.7000694,140.73058809999998],
      Sennan: [34.3660047,135.27333929999998],
      Suita: [34.7594526,135.51685999999995],
      Sakai: [34.573262,135.48299799999995],
      Takatsuki: [34.84615849999999,135.61727159999998],
      Ikeda: [34.8217051,135.42844390000005],
      Kaizuka: [34.4375837,135.358517]
    ]
    costItems = [1000, 1500, 2000, 2500, 3000, 35000, 4000, 4500, 5000]
    stationItemsJP = ['阿倍野駅' ,'我孫子駅','朝潮橋駅','阿波座駅','弁天町駅','コスモスクエア駅']
    stationItemsEN = ['Abeno' ,'Abiko','Asashiobashi','Awaza','Bentenchō','Cosmosquare']
    explanation_jp = [
      '内リあね葬能でつざば開逮ヱト厚索4記ッこ小主ぞおが落法ヱ愛卓シ港覧ぱ上米容ふ勝音び。32由諸オロ特巡せきゃぶ案市オ回部治ムヤリア観国ずさ学浦ぱク情済レルケテ気写モメテリ作2者テコ報査トイ変短カウ最報かくッ済科ぽそ会右落伸ぴひ。制ちゆ能97教メテ気郎ロヱレ作宴購いでゃお築45方長しス転式火サニヘ球長周タヲモ巡号らたン甲業ふもらの姿借期め新氏んちルっ城量探后ッよ。',
      '香は成理ワ査要オイタサ製泉とけレ廷医事内ぴげレ斐帯ッイぜか載完睦い納津ぞ楽26一なぞこ。議ねてゅづ彩利きだね島氏アカクロ関通キ春年飲ナ度3問雪辺ゅかぴて掲細づ努収せン定国ツ百寄さりがド投好無スごつも光8佐宝ナタ問覚地防ゆわ。提ハ潮育かぞぐリ下式坂マムテネ土展ぱんぽ正75間ラそスし付披ワエ城落ツモ春文ぞはろん無辱キヌテシ犯正エワコツ予阜訓誘て。',
      '投ヱオ味審な帯作ゆと出島マイヲ更川ぼはクの厚稚て告気創きねのて様了回ろっ肝4業スレわ配演読ヒモ格谷モ支舞っ強国ごりをざ社考ワセア中4最ア待終仁借ぼが。動鋭トヌ早品ネ米対計準ヲリヨ果必ヲト提詳レネノヨ猪償ルフコ健夜へぜ下国お斐与85告6模ソヱ省報ドー実侑倣冥てもぽ。',
      '科ユシマコ目接けび載遂ょなーた小進ヒ雪百梨真マムヲ与異展タナヨ興一ッねれえ集提ノ料申レも民契ヨノレ気約はド初攻きあト野38稿ばも接本準ごえゃ。灰み記政つをど風動ふト記費ヌアリ毎市オヘ首禁ゃイ近羽へぜ告事ふと伊80初モチ座七ク歩出う亡公5居17作ろゅづ現数割るろ。歌てご若置セツヌ出日刊のげづ見記51沢ヱ続消アスルノ盤輝膚ハトヘ鋭画関う問際シワ権率倒停ねけ。'
    ]
    explanation_en = [
      'Mauris a metus tincidunt, egestas metus eget, pretium lacus. Vestibulum iaculis lectus id dui pulvinar, vitae rhoncus nisl lacinia. Quisque ullamcorper, nisi et dapibus lobortis, nisi nisl iaculis massa, ut ultrices quam ipsum vel purus. Morbi consectetur at lorem sed ultrices. Vestibulum tempor viverra neque, vel sodales justo pellentesque quis. Proin sed mauris ut mi auctor porttitor. Nulla finibus massa id felis molestie mollis dapibus ac nisi. Quisque lorem tortor, convallis at dui mattis, aliquet gravida lectus. Sed venenatis at tortor in hendrerit. Ut nec tempor ante, id pretium erat. Praesent tristique eros quis ipsum mattis varius. Donec et orci id tellus eleifend tincidunt. Duis accumsan finibus libero non venenatis. Phasellus efficitur lorem nec arcu volutpat suscipit. Maecenas aliquet, risus suscipit vulputate semper, leo eros maximus libero, nec commodo nulla magna et est.',
      'Donec ut nibh sit amet arcu rutrum sodales. Nullam feugiat erat at neque congue, eget condimentum nibh fringilla. Quisque vel laoreet lacus, eu lobortis turpis. Phasellus vel est ex. Maecenas pharetra lacus nec porttitor dignissim. Fusce facilisis viverra orci ac volutpat. Nulla facilisi. Integer quis sapien mollis, tempor orci quis, vehicula erat. Phasellus luctus urna quis scelerisque rutrum. Pellentesque tortor libero, placerat id scelerisque ut, elementum quis arcu.',
      'Integer ut elementum felis. Suspendisse eget est neque. In molestie est eget diam interdum, eget sollicitudin diam tincidunt. Vivamus non ex luctus, tristique urna quis, suscipit lorem. Curabitur finibus feugiat turpis, id lobortis odio auctor sed. Etiam ac turpis at ipsum iaculis accumsan ut ac tellus. Aliquam lobortis turpis neque, hendrerit tincidunt metus commodo id. Nullam porttitor mi sem, non scelerisque augue scelerisque non. Praesent ut aliquet mauris, eget ultricies velit.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent odio velit, luctus at luctus et, feugiat quis leo. Phasellus ac iaculis dui. Morbi ligula tortor, ullamcorper eget venenatis id, mollis sit amet eros. Integer volutpat metus sed nibh pellentesque aliquet. Curabitur convallis arcu dolor, ac fermentum metus convallis a. In vitae est est. Aenean blandit purus auctor, fringilla mi nec, efficitur ante. Morbi nec nibh non elit faucibus mattis ac quis diam. Sed eu varius tortor. Phasellus consectetur pretium lacus et dapibus. Pellentesque non sem sodales justo volutpat commodo vitae sed ante.'
    ]
    startTime = ['08:00', '08:30', '09:00', '09:30', '10:00','10:30', '11:00', '11:30', '12:00', '12:30']
    endTime = ['14:00', '14:30', '15:00', '15:30', '16:00','16:30', '17:00', '17:30', '18:00', '18:30']
    
    currentDate = Time.current.strftime('%Y-%m-%d').to_date
    date = isFuturEvents ? currentDate + i : currentDate - i  
    
    case section
      when 'SC'
        titleBySectionJp = "社交的イベント #{i}"
        titleBySectionEn = "Social Event #{i}"
      when 'LX'
        titleBySectionJp = "ランゲージイベント #{i}"
        titleBySectionEn = "Language Event #{i}"
      when 'SP'
        titleBySectionJp = "#{tagJp} 大会"
        titleBySectionEn = "#{tagEn} Tournament"
    end

    title = [{
      section: section,
      titleJp: titleBySectionJp,
      titleEn: titleBySectionEn
    }]

    Event.create(
      title: title.to_json,
      location_jp: "#{townJP} #{locationItemsJP.sample}",
      location_en: "#{townEn} #{locationItemsEn.sample}",
      date: date.strftime('%Y-%m-%d'),
      start_time: startTime.sample,
      end_time: endTime.sample,
      capacity: rand(15..30),
      threshold: rand(5..10),
      section: [section],
      tags: [tagEn],
      positions: positionItems[0][townEn.to_sym],
      access_jp: " #{townJP}#{stationItemsJP.sample}または#{stationItemsJP.sample}から徒歩#{rand(1..4)}-#{rand(5..10)}分",
      access_en: "#{rand(1..4)}-#{rand(5..10)}min walk from #{townEn}. #{stationItemsEN.sample} or #{stationItemsEN.sample} Station",
      cost: costItems.sample,
      user_id: rand(1..4),
      explanation_jp: explanation_jp.sample,
      explanation_en: explanation_en.sample
    )
  end
end


begin
  createEvents(49, false)
  createEvents(49, true)
end


# EventPicture.count
# Event.count

# 7.times {
#   for i in 1..14 do
#     dupPicture = EventPicture.find(i).dup
#     dupPicture.save
#   end 
# }

# Event.all.each_with_index do |event, index|
#   i = index + 1
#   EventPicture.find(i).update(event_id: i)
# end

# EventPicture.where(event_id: nil).count
# ids = EventPicture.where(event_id: nil).pluck(:id)
# EventPicture.where(id: ids).destroy_all