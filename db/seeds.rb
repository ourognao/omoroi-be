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
    tagsItems = ['volleyball', 'basketball', 'pingpong', 'futsal', 'badminton', 'kickboxing', 'other']
    tag = tagsItems.sample
    locationItems = ['Sports Center', 'Gymnastic Club']
    townItems = ['Mishima', 'Toyono', 'Senboku', 'Sennan', 'Suita', 'Sakai', 'Takatsuki', 'Ikeda', 'Kaizuka']
    town = townItems.sample
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
    stationItems = ['Abeno' ,'Abiko','Asashiobashi','Awaza','Bentenchō','Cosmosquare']
    explanation = [
      'Mauris a metus tincidunt, egestas metus eget, pretium lacus. Vestibulum iaculis lectus id dui pulvinar, vitae rhoncus nisl lacinia. Quisque ullamcorper, nisi et dapibus lobortis, nisi nisl iaculis massa, ut ultrices quam ipsum vel purus. Morbi consectetur at lorem sed ultrices. Vestibulum tempor viverra neque, vel sodales justo pellentesque quis. Proin sed mauris ut mi auctor porttitor. Nulla finibus massa id felis molestie mollis dapibus ac nisi. Quisque lorem tortor, convallis at dui mattis, aliquet gravida lectus. Sed venenatis at tortor in hendrerit. Ut nec tempor ante, id pretium erat. Praesent tristique eros quis ipsum mattis varius. Donec et orci id tellus eleifend tincidunt. Duis accumsan finibus libero non venenatis. Phasellus efficitur lorem nec arcu volutpat suscipit. Maecenas aliquet, risus suscipit vulputate semper, leo eros maximus libero, nec commodo nulla magna et est.',
      'Donec ut nibh sit amet arcu rutrum sodales. Nullam feugiat erat at neque congue, eget condimentum nibh fringilla. Quisque vel laoreet lacus, eu lobortis turpis. Phasellus vel est ex. Maecenas pharetra lacus nec porttitor dignissim. Fusce facilisis viverra orci ac volutpat. Nulla facilisi. Integer quis sapien mollis, tempor orci quis, vehicula erat. Phasellus luctus urna quis scelerisque rutrum. Pellentesque tortor libero, placerat id scelerisque ut, elementum quis arcu.',
      'Integer ut elementum felis. Suspendisse eget est neque. In molestie est eget diam interdum, eget sollicitudin diam tincidunt. Vivamus non ex luctus, tristique urna quis, suscipit lorem. Curabitur finibus feugiat turpis, id lobortis odio auctor sed. Etiam ac turpis at ipsum iaculis accumsan ut ac tellus. Aliquam lobortis turpis neque, hendrerit tincidunt metus commodo id. Nullam porttitor mi sem, non scelerisque augue scelerisque non. Praesent ut aliquet mauris, eget ultricies velit.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent odio velit, luctus at luctus et, feugiat quis leo. Phasellus ac iaculis dui. Morbi ligula tortor, ullamcorper eget venenatis id, mollis sit amet eros. Integer volutpat metus sed nibh pellentesque aliquet. Curabitur convallis arcu dolor, ac fermentum metus convallis a. In vitae est est. Aenean blandit purus auctor, fringilla mi nec, efficitur ante. Morbi nec nibh non elit faucibus mattis ac quis diam. Sed eu varius tortor. Phasellus consectetur pretium lacus et dapibus. Pellentesque non sem sodales justo volutpat commodo vitae sed ante.'
    ]
    startTime = ['08:00', '08:30', '09:00', '09:30', '10:00','10:30', '11:00', '11:30', '12:00', '12:30']
    endTime = ['14:00', '14:30', '15:00', '15:30', '16:00','16:30', '17:00', '17:30', '18:00', '18:30']
    
    currentDate = Time.current.strftime('%Y-%m-%d').to_date
    date = isFuturEvents ? currentDate + i : currentDate - i  

    pictureItems = [
      '/images/top/carousel/1.jpg',
      '/images/top/carousel/2.jpg',
      '/images/top/carousel/3.jpg',
      '/images/top/carousel/4.jpg',
      '/images/top/carousel/5.jpg',
      '/images/top/carousel/6.jpg',
      '/images/top/carousel/7.jpg'
    ]
    
    Event.create(
      picture: pictureItems.sample,
      title: "#{tag} Tournament",
      location: "#{town} #{locationItems.sample}",
      date: date.strftime('%Y-%m-%d'),
      start_time: startTime.sample,
      end_time: endTime.sample,
      remaining: rand(1..15),
      capacity: rand(15..30),
      threshold: rand(5..10)-
 -    section: 'SC',
      tags: [tag],
      positions: positionItems[0][town.to_sym],
      access: "#{rand(1..4)}-#{rand(5..10)}min walk from #{town}. #{stationItems.sample} or #{stationItems.sample} Station",
      cost: costItems.sample,
      user_id: rand(1..4),
      explanation: explanation.sample
    )
  end
end


begin
  createEvents(349, false)
  createEvents(349, true)
end
