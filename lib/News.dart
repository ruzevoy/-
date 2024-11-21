import 'package:flutter/material.dart';
import 'package:flutter_application_22/Login/Authorization.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<Map<String, String>> newsList = [
    {
    'title': 'Сегодня солнечно',
    'content': 'Сегодняшний день радует нас ясным небом и солнечным светом, который наполняет атмосферу теплотой и яркостью. С утра погода будет без облаков, и солнце будет ярко светить, создавая атмосферу легкости и хорошего настроения. Температура воздуха держится на уровне около 25°C, что делает день комфортным для большинства активностей на улице Легкий ветерок, если он и будет, принесет приятное ощущение свежести и поможет смягчить жару, создавая оптимальные условия для прогулок по парку, по улице или на пляже. Сегодня идеальные условия для проведения времени на открытом воздухе, будь то пикник, спортивные занятия или просто отдых на скамейке под деревом.я тех, кто планирует активно проводить день, такие условия идеально подходят для прогулок на велосипеде, бега или йоги на открытом воздухе. Важно помнить, что при таком солнечном дне стоит позаботиться о защите кожи — не забывайте использовать солнцезащитный крем и носить очки от солнца'
  
  },
  {
    'title': 'Завтра возможен дождь',
    'content': 'СЗавтра синоптики прогнозируют изменение погоды — в первой половине дня возможны кратковременные дожди, которые могут быть как легкими, так и более интенсивными. Осадки ожидаются в основном во второй половине дня, и они могут затронуть различные районы города. Погода будет переменной, с облачностью, которая будет чередоваться с прояснениями.Температура воздуха в течение дня останется умеренной — около 15°C, что вполне комфортно для выхода на улицу, но дождь может добавить немного дискомфорта, особенно если вы окажетесь на улице без зонта. Ветер будет умеренным, с порывами до 10 м/с, что также усилит ощущение прохлады. Поэтому рекомендуется одеваться в одежду, которая будет защищать от дождя и ветра.В связи с дождем, людям, которые планируют активные мероприятия на свежем воздухе, стоит заранее подумать о том, чтобы взять с собой зонт, дождевик или непромокаемую обувь. Если вы планируете прогулки или поездки по делам, позаботьтесь о защите своих вещей от влаги, чтобы избежать неприятных последствий.'
  },
  {
    'title': 'Скидки на фрукты',
    'content': 'Сегодня в крупных супермаркетах города стартовали уникальные акции, приуроченные к началу сезона. Скидки на свежие фрукты достигают 30%, что делает это время отличным для пополнения запасов витаминов на осень и зиму. На полках можно найти широкий ассортимент местных и импортных фруктов — от яблок и груш до экзотических фруктов, таких как манго, ананасы и киви.В особенности выгодные предложения на сезонные фрукты, такие как яблоки, груши, сливы и виноград. Эти фрукты не только вкусные, но и полезные — они богаты витаминами и антиоксидантами, что поможет укрепить иммунную систему перед холодами. Также в скидочных предложениях можно найти цитрусовые — апельсины, мандарины и грейпфруты, которые богаты витамином C и идеально подходят для профилактики простудных заболеваний.Кроме того, фруктовые наборы с разными видами экзотики, как бананы, киви, манго, папайя и ананасы, также продаются с большими скидками. Это отличная возможность побаловать себя экзотическими фруктами, не переплачивая.'
  },
  {
    'title': 'Открытие нового ТЦ',
    'content': 'Сегодня в центре города состоялось долгожданное открытие нового торгового центра, который стал настоящим украшением и новым центром притяжения для жителей и гостей города. Новый ТЦ, расположенный в центральной части города, обещает стать важной частью городского ландшафта и предложить разнообразные возможности для шоппинга, отдыха и досуга.Торговый центр занимает площадь более 15 000 квадратных метров и включает в себя более 100 магазинов, кафе, ресторанов и развлекательных зон. Среди магазинов, представленных в новом ТЦ, — как мировые бренды, так и местные компании, которые предлагают широкий ассортимент товаров, от одежды и обуви до косметики и аксессуаров.Для семей с детьми в новом ТЦ предусмотрены игровые зоны, игровые автоматы и развлекательные аттракционы, которые сделают поход по магазинам интересным и увлекательным для всех членов семьи. В дополнение к шоппингу, ТЦ предлагает посетителям возможность насладиться вкусной едой в кафе и ресторанах, которые предлагают блюда разных кухонь мира — от традиционной японской кухни до итальянской пасты.'
  },
  {
    'title': 'Технологические новинки',
    'content': 'На недавно прошедшей выставке технологий были представлены самые современные гаджеты, которые зададут тренды в мире технологий в ближайшие годы. Среди ярких новинок — инновационные смартфоны, умные часы, а также другие устройства, которые обещают улучшить повседневную жизнь и облегчить взаимодействие с технологическими решениями.Одной из главных новинок стали новые флагманские смартфоны от ведущих брендов. Эти устройства оснащены самыми мощными процессорами, улучшенными камерами с технологией искусственного интеллекта и возможностью записи видео в 8K. Особое внимание уделено дисплеям, которые теперь поддерживают обновление с частотой до 120 Гц, что обеспечивает более плавное отображение изображения и улучшенную реакцию на действия пользователя. Кроме того, устройства получили обновленные аккумуляторы с долгим сроком службы и поддержку сверхбыстрой зарядки.На выставке были также представлены умные часы, которые становятся не только стильным аксессуаром, но и полноценным инструментом для следования за здоровьем. Новые модели обладают улучшенными функциями мониторинга здоровья, включая отслеживание уровня кислорода в крови, мониторинг стресса, улучшенные датчики сна и поддержка различных видов тренировок. Они также получили улучшенные экраны и более длительное время работы от одной зарядки.'
  },
  {
    'title': 'Успехи студентов',
    'content': 'В этом учебном году студенты местного университета продемонстрировали потрясающие достижения, завоевав призовые места на международной олимпиаде по программированию. Конкурс, собравший более 1000 участников из разных уголков мира, стал настоящим испытанием для команд, представляющих различные образовательные учреждения.Студенты продемонстрировали высокий уровень подготовки, решив сложнейшие задачи за ограниченное время, что позволило им занять высокие позиции в общем зачете. Среди задач, с которыми участники справлялись, были как теоретические вопросы по алгоритмам, так и практические задачи, требующие разработки кода для решения реальных проблем.Особое внимание стоит уделить команде из местного университета, которая смогла обойти многих признанных лидеров в области программирования. В составе победившей команды – студенты старших курсов, специализирующиеся в области информатики и прикладных наук. Это стало ярким свидетельством того, что система образования в регионе активно развивается и способствует подготовке высококлассных специалистов в области информационных технологий..'
  },
  {
    'title': 'Прогноз экономики',
    'content': 'Экономисты и аналитики прогнозируют, что в ближайшие месяцы российская экономика продолжит развиваться, несмотря на глобальные экономические вызовы. С учетом текущих макроэкономических показателей и международной ситуации, ожидается рост в ключевых секторах экономики, особенно в области информационных технологий (ИТ) и инновационных технологий.Прогнозы, сделанные ведущими экспертами, утверждают, что в 2024 году российская экономика может достичь умеренного роста благодаря увеличению инвестиций в отечественные производства, развитие новых технологий и улучшение бизнес-климата. Важным фактором этого роста станет развитие высокотехнологичных отраслей, таких как ИТ, искусственный интеллект и энергетика, что, в свою очередь, откроет новые возможности для местных компаний.'
  },
  {
    'title': 'Книжные рекомендации',
    'content': 'Эта неделя — настоящая находка для любителей литературы! В книжных магазинах появились новинки, которые подойдут для самых разных вкусов и интересов. Для тех, кто предпочитает погружаться в мир фэнтези, научной фантастики или исторических романов, есть отличные предложения.Магия света" — новый роман в жанре фэнтези, который переносит читателей в волшебный мир, наполненный магическими существами и опасными приключениями. Главная героиня, молодая волшебница, должна разобраться с темными силами, угрожающими её миру, и пройти путь, полный испытаний и самопознания.Сквозь время" — захватывающая научно-фантастическая история о путешествиях во времени. Главный герой, ученый, случайно открывает способ перемещаться в прошлое и будущее. Однако каждая его поездка изменяет ход истории, и теперь ему предстоит столкнуться с последствиями своих действий.'
  },
  {
    'title': 'Советы по здоровью',
    'content': 'Забота о своем здоровье — это не просто тренд, а необходимость, особенно в холодное время года. Важно не только поддерживать физическую активность, но и правильно питаться, уделять внимание психологическому состоянию и вовремя отдыхать. В этом выпуске мы подготовили несколько полезных рекомендаций, которые помогут вам укрепить иммунитет и чувствовать себя отлично даже в самые холодные месяцы.В зимний период особенно важно поддерживать иммунную систему с помощью правильного питания. Включите в рацион больше свежих овощей, фруктов и ягод, а также продуктов, богатых витаминами С и Е. Помните, что цитрусовые, киви, болгарский перец и черная смородина — отличные источники витаминов. Также стоит есть продукты, богатые омега-3 жирными кислотами — они помогают поддерживать сердечно-сосудистую систему и стимулируют обмен веществ.В холодное время года наш организм теряет больше энергии на поддержание температуры тела, что может ослабить иммунную систему. Чтобы предотвратить ослабление иммунитета, рекомендуется принимать витамин D, так как в зимние месяцы его естественное поступление из солнечных лучей ограничено. Также полезными будут добавки с цинком и селеном, которые поддержат защитные силы организма.'
  },
  {
    'title': 'Путешествия и маршруты',
    'content': 'Зима — прекрасное время для того, чтобы отправиться в путешествие и открыть новые маршруты. Если вы еще не решили, куда поехать в зимние каникулы, мы подготовили для вас несколько вдохновляющих идей, которые помогут выбрать идеальный маршрут для активного отдыха и спокойных зимних каникул. Здесь вы найдете самые популярные направления для зимних путешествий, включая лыжные курорты, горные и городские маршруты.Зимний отдых ассоциируется с горными склонами, снегом и лыжами. В России есть множество отличных лыжных курортов, где можно наслаждаться не только катанием, но и красотой природы. Среди самых популярных — курорты Красной Поляны в Сочи, горнолыжные курорты в Карелии и Башкортостане, а также Шерегеш в Кемеровской области. Эти места предлагают трассы различного уровня сложности, от начинающих до опытных спортсменов. Помимо катания на лыжах, там часто проводят фристайл, сноуборд и различные зимние активности, такие как катание на санях и квадроциклах.Зимний туризм — это не только отдых на лыжах, но и путешествия по красивым городам, которые в зимний период превращаются в сказочные. Например, Санкт-Петербург и Москва в декабре и январе преображаются в настоящие зимние чудеса с яркими огнями, рождественскими ярмарками и новогодними мероприятиями. Кроме того, не забывайте о старинных городах России, таких как Владимир, Суздаль или Казань. Здесь вы сможете погрузиться в атмосферу русского культурного наследия и насладиться зимними видами исторических зданий.'
  },
  {
    'title': 'Рецепты на каждый день',
    'content': 'Каждый день хочется радовать себя и своих близких вкусными и полезными блюдами. Но как найти баланс между временем на приготовление и вкусом? Мы собрали для вас простые, но оригинальные рецепты, которые можно приготовить даже в самые занятые дни. Эти блюда подойдут для завтраков, обедов и ужинов, и они не потребуют много времени на подготовку.Начните день с питательного омлета, который не только зарядит вас энергией, но и подарит отличный вкус. Для его приготовления вам понадобятся яйца, немного молока, овощи (помидоры, болгарский перец, шпинат или зелень) и тертый сыр. Просто взбейте яйца с молоком, добавьте нарезанные овощи, обжарьте все на сковороде, посыпьте сыром и дайте ему расплавиться. Омлет будет готов за несколько минут, а его можно адаптировать под любой вкус!Легкий и полезный суп — отличное решение для обеда. Для этого супа вам понадобятся брокколи, картофель, лук, чеснок и сливки. В кастрюле обжарьте лук и чеснок, добавьте картофель и брокколи, залейте водой и варите до мягкости. Затем все измельчите блендером до пюреобразного состояния и добавьте немного сливок для кремовой текстуры. Суп получается не только вкусным, но и очень полезным.'
  },
  {
    'title': 'Развлекательные мероприятия',
    'content': 'Город никогда не стоит на месте, и каждый уикенд приносит новые возможности для отдыха и развлечений. В этом разделе мы расскажем вам о самых ярких и интересных событиях, которые стоит посетить в ближайшие дни.Местные и зарубежные артисты всегда рады подарить публике незабываемые впечатления. На выходных вас ждут концерты различных жанров: от рок-групп и поп-исполнителей до классической музыки. В этом месяце состоится концерт популярной рок-группы, а также вечера с классической музыкой для любителей изысканных мелодий. Не забудьте приобрести билеты заранее, ведь такие мероприятия часто собирают полный зал.Для любителей искусства в городе проходят различные выставки. В ближайшие дни откроется выставка современного искусства, на которой можно будет увидеть работы местных художников, а также мировых мастеров. Также в арт-галереях города проходят тематические экспозиции, посвященные истории, культуре и традициям разных народов. Если вы хотите познакомиться с уникальными произведениями искусства, обязательно посетите одну из таких выставок.'
  },
  {
    'title': 'Фильмы недели',
    'content': 'На этой неделе в кинотеатрах стартуют долгожданные премьеры, которые стоит увидеть каждому любителю хорошего кино. В подборке — как блокбастеры, так и необычные авторские фильмы, каждый из которых обещает подарить зрителям незабываемые эмоции и впечатления.Сквозь снежные пустоши будущего мира пробивается история о выживании, любви и борьбе за свободу. В центре сюжета — группа людей, оказавшихся на поезде, который мчится по замороженному миру, где выжить можно только в движении. Каждый пассажир этого поезда скрывает свою историю и тайны. Режиссер создал настоящую кинематографическую атмосферу, полную переживаний и неожиданных поворотов.Смех и слезы переплетаются в новом комедийном фильме о непростых отношениях и поиске своего счастья. Главный герой — успешный, но одинокий мужчина, который решает кардинально изменить свою жизнь и отправляется в небольшое приморское поселение. Это история о том, как случайные встречи могут изменить всё. Приятная атмосфера, добрые шутки и трогательная любовь делают фильм отличным выбором для вечернего просмотра.'
  },
  {
    'title': 'Тренды в моде',
    'content': 'Зимний сезон 2024 обещает быть ярким и стильным, с акцентом на комфорт, тепло и оригинальность. Этот год привносит в мир моды новые идеи, которые идеально подходят для холодных месяцев, не забывая при этом о трендах и актуальных направлениях.Зимой 2024 в моде не только тёмные, приглушённые оттенки, но и яркие акценты, которые сделают любой образ свежим и заметным. Оттенки красного, оранжевого, ярко-голубого и зелёного будут не только в одежде, но и в аксессуарах. Модные дома активно используют яркие цвета в своих коллекциях, чтобы развеять зимнюю хандру. Геометрические принты, абстракции и флоральные узоры также вернулись в моду, добавляя динамичности и индивидуальности в повседневный стиль.В 2024 году объемные и многослойные одежды продолжают оставаться на пике популярности. Стиль oversize (оверсайз) по-прежнему в тренде, особенно в таких элементах, как пальто, пуховики, свитера и платья. Эти модели обеспечивают максимальный комфорт и тепло, а также создают интересные, непринуждённые образы. В сочетании с ботинками на платформе и большими аксессуарами этот стиль будет особенно актуален.'
  },
  {
    'title': 'Новости спорта',
    'content': 'Победа сборной по футболу Вчера сборная страны одержала важную победу в одном из самых ожидаемых матчей года. Матч был решающим для выхода в финал международного турнира, и команда продемонстрировала отличную игру, сочетая тактическую дисциплину с мощными атакующими действиями.Подготовка к этому матчу была интенсивной и всесторонней. Тренеры сборной сделали акцент на анализе игры соперника и улучшении командной слаженности. Благодаря долгим тренировкам и анализу предыдущих встреч, игроки смогли выстроить тактику, которая полностью нейтрализовала сильные стороны оппонента и позволила добиться уверенной победы.На протяжении всей игры были моменты, когда каждый из игроков сборной мог стать героем встречи. Однако именно нападающий Иван Иванов стал ключевой фигурой, забив победный гол в последние минуты матча. Также стоит отметить великолепную игру вратаря, который несколько раз спас команду от пропущенных мячей, демонстрируя высокий класс и уверенность в своих силах.'
  },
  ];

  final List<Map<String, String>> favorites = [];

  int _currentIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewsListScreen(newsList: newsList, favorites: favorites),
      FavoritesScreen(favorites: favorites),
      Profile(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Аккаунт',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}

class NewsListScreen extends StatelessWidget {
  final List<Map<String, String>> newsList;
  final List<Map<String, String>> favorites;

  NewsListScreen({required this.newsList, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                title: Text(
                  newsList[index]['title']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    favorites.contains(newsList[index])
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    if (favorites.contains(newsList[index])) {
                      favorites.remove(newsList[index]);
                    } else {
                      favorites.add(newsList[index]);
                    }
                    (context as Element).reassemble();
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailScreen(news: newsList[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;

  FavoritesScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? Center(child: Text('Избранных новостей пока нет'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        favorites[index]['title']!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailScreen(news: favorites[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}


class NewsDetailScreen extends StatelessWidget {
  final Map<String, String> news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          news['content']!,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

UserData userData = UserData(
  lastName: '',
  firstName: '',
  middleName: '',
  gender: '',
  birthDate: '',
  email: '',
  phone: '',
);

class _ProfileState extends State<Profile> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage(); 
  }


  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }


  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      setState(() {
        _imageFile = File(filePath);
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 4,
                        ),
                      ],
                      image: _imageFile != null
                          ? DecorationImage(
                              image: FileImage(_imageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ListTile(
                          title: const Text(
                            "Редактировать",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 88, 87, 91),
                            ),
                          ),
                          leading: const Icon(Icons.create, size: 16),
                          onTap: () {
                            Navigator.push<UserData>(
                              context,
                              MaterialPageRoute(builder: (context) => DataUpdate()),
                            ).then((updatedUserData) {
                              if (updatedUserData != null) {
                                setState(() {
                                  userData = updatedUserData;
                                });
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ListTile(
                          title: const Text(
                            "Изменить фото",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 88, 87, 91),
                            ),
                          ),
                          leading: const Icon(Icons.add_photo_alternate, size: 17),
                          onTap: _pickImage,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.lastName.isNotEmpty ? userData.lastName : 'Фамилия',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.firstName.isNotEmpty ? userData.firstName : 'Имя',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.middleName.isNotEmpty ? userData.middleName : 'Отчество',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.gender.isNotEmpty ? userData.gender : 'Пол',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.birthDate.isNotEmpty ? 'Дата рождения: ${userData.birthDate}' : 'Дата рождения',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.email.isNotEmpty ? userData.email : 'Электронная почта',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.phone.isNotEmpty ? userData.phone : 'Телефон',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
             onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Authorization()
                        ),
                      );
                    },
              child: Text('Выйти'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class UserData {
  String lastName;
  String firstName;
  String middleName;
  String gender;
  String birthDate;
  String email;
  String phone;

  UserData({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.phone,
  });
}

class DataUpdate extends StatefulWidget {
  const DataUpdate({super.key});

  @override
  _DataUpdateState createState() => _DataUpdateState();
}

class _DataUpdateState extends State<DataUpdate> {
  String _selectedValue = '';

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 20),
                  const Center(
                    child: Text(
                      "Основная информация о вас",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 88, 87, 91),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Фамилия'),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zа-яА-ЯёЁ]')),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zа-яА-ЯёЁ]')),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _middleNameController,
                decoration: const InputDecoration(labelText: 'Отчество'),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Zа-яА-ЯёЁ]')),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Пол",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 88, 87, 91),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Radio(
                    activeColor: const Color.fromARGB(255, 74, 187, 80),
                    value: 'Мужской',
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                  ),
                  const Text('Мужской'),
                  const SizedBox(width: 10),
                  Radio(
                    activeColor: const Color.fromARGB(255, 74, 187, 80),
                    value: 'Женский',
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value as String;
                      });
                    },
                  ),
                  const Text('Женский'),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _birthDateController,
                decoration: const InputDecoration(labelText: 'Дата рождения'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Электронная почта'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Номер телефона'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      UserData userData = UserData(
                        lastName: _lastNameController.text,
                        firstName: _firstNameController.text,
                        middleName: _middleNameController.text,
                        gender: _selectedValue,
                        birthDate: _birthDateController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                      );
                      Navigator.pop(context, userData);
                    },
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

