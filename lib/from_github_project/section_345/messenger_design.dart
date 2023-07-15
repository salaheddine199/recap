import 'package:flutter/material.dart';

class MessengerDesign extends StatefulWidget {
  const MessengerDesign({Key? key}) : super(key: key);

  @override
  _MessengerDesignState createState() => _MessengerDesignState();
}

class _MessengerDesignState extends State<MessengerDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              const CircleAvatar(
                radius: 23,
                backgroundImage:
                    AssetImage("assets/images/profile picture.jpg"),
              ),
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  // color: Colors.black.withOpacity(.8),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 18,
              child: Icon(
                Icons.camera_alt,
                size: 22,
              ),
            ),
          ),
          CircleAvatar(
            radius: 18,
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt,
                size: 22,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 18,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 22,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Search",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      BuildColumnItem(chat: listChats[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  itemCount: 8,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    BuildRowItem(chat: listChats[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: listChats.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildColumnItem extends StatelessWidget {
  const BuildColumnItem({super.key, required this.chat});

  final ChatPerson chat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      child: Column(
        children: [
          MyStack(image: chat.image, isActive: chat.isActive),
          const SizedBox(
            height: 5,
          ),
          Text(
            chat.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BuildRowItem extends StatelessWidget {
  const BuildRowItem({super.key, this.chat});

  final chat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyStack(image: chat.image, isActive: chat.isActive),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    chat.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  if (chat.isActive == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  Text(chat.sendTime),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({super.key, required this.image, required this.isActive});

  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage:
              // AssetImage("assets/images/profile picture.jpg"),
              NetworkImage(image),
        ),
        if (isActive == true)
          const CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
          ),
        if (isActive == true)
          const CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
      ],
    );
  }
}




// make the logic for this design:
class ChatPerson {
  final String image;
  final String name;
  final String message;
  final String sendTime;
  final bool isActive;

  ChatPerson({
    required this.image,
    required this.name,
    required this.message,
    required this.sendTime,
    required this.isActive,
  });
}

List<ChatPerson> listChats = [
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/190108336_322648402555040_2100790391455013605_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeE_38JQEs3C8ge34VzF6oyfGSpiHjKjXKQZKmIeMqNcpL2xMZ9HDVpVdRObjxO93kYiVbKRdHshCF7Om1uYzZly&_nc_ohc=KvjS7tJmdzkAX81lojp&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfD65ZLi3iunSlYylDxSM2jX0w9Eevaxshk-fmp1xBMRJA&oe=64DA1A40",
    name: "Cristiano Ronaldo",
    message: "Good Morning, are you free? I need your help",
    sendTime: "16:40",
    isActive: true,
  ),

  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/199385759_345470910277839_3988273979229903886_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZ_H0T9GbTSJ-bvETxpJPn_R1YrUnrs9b9HVitSeuz1vHo90XI81a86Fk0O5eaRQZWPSDDNJYcQ2SUGPvTMnfw&_nc_ohc=SBgHgPvus3gAX8jfPrg&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfCK1Z4ETKtFEqhW3QKKLa4TtUCp2WBw9isQnCIsdfAHGQ&oe=64D9F58F",
    name: "Leo Messi",
    message: "So, what's up!",
    sendTime: "16:38",
    isActive: false,
  ),

  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t39.30808-6/328251162_954776032597397_2540120982956477289_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZZgEv89i3l3ZjINgOAjhAuk3YFhrVORW6TdgWGtU5FQjzIE-lEol0XTfeWhIE_mMG9ZSlyX2uek38SzP5GJ9E&_nc_ohc=oLVE-buNcn0AX__ix-_&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfDlRtSc6_balKR5E5d2TFnv5Pfq6Q9-GMgAQGWHA97f6Q&oe=64B77740",
    name: "Alisha Lehmann",
    message: "Can we talk now, please!",
    sendTime: "16:00",
    isActive: true,
  ),

  ChatPerson(
    image:
        "https://scontent.fqsf1-2.fna.fbcdn.net/v/t39.30808-6/311042515_665888554892375_731009722931901970_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF_lLRT4BxuQJKqFot_SSD4Ajulsf0Z9JgCO6Wx_Rn0mKj1vy5zAR1aHVWJBwVEJR_4k-2JpeHGO_rSOgiWlXWN&_nc_ohc=T1IasVSJDuMAX_K2pG6&_nc_ht=scontent.fqsf1-2.fna&oh=00_AfBVCGTE8OZVq9oWwkDEkeNWQB13dX2Un9arAEDUsBT6jA&oe=64B7326C",
    name: "Riyad Mahrez",
    message: "we have a game later, can you come?",
    sendTime: "15:48",
    isActive: false,
  ),

  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/164676323_309063850578579_6478165202362006138_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFyWnFpcQYNNnYd7ZnqzbbbtWL5baxbPQu1YvltrFs9C29XweVdYF-IV2SlpCAhhjla70f59aWcKuTle9XxR9qH&_nc_ohc=-mND-CP9XAYAX9J2HxH&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfCQBj7V8toUQrwYkpyoV66gxFCP76OMUdoqcb_GZEsm6A&oe=64DA29EB",
    name: "Mohamed Salah",
    message: "That's a good advice, you're a life saver!",
    sendTime: "14:30",
    isActive: true,
  ),

  // repeated
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t39.30808-6/328251162_954776032597397_2540120982956477289_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZZgEv89i3l3ZjINgOAjhAuk3YFhrVORW6TdgWGtU5FQjzIE-lEol0XTfeWhIE_mMG9ZSlyX2uek38SzP5GJ9E&_nc_ohc=oLVE-buNcn0AX__ix-_&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfDlRtSc6_balKR5E5d2TFnv5Pfq6Q9-GMgAQGWHA97f6Q&oe=64B77740",
    name: "Alisha Lehmann",
    message: "Can we talk now, please!",
    sendTime: "14:00",
    isActive: true,
  ),
  ChatPerson(
    image:
        "https://scontent.fqsf1-2.fna.fbcdn.net/v/t39.30808-6/311042515_665888554892375_731009722931901970_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF_lLRT4BxuQJKqFot_SSD4Ajulsf0Z9JgCO6Wx_Rn0mKj1vy5zAR1aHVWJBwVEJR_4k-2JpeHGO_rSOgiWlXWN&_nc_ohc=T1IasVSJDuMAX_K2pG6&_nc_ht=scontent.fqsf1-2.fna&oh=00_AfBVCGTE8OZVq9oWwkDEkeNWQB13dX2Un9arAEDUsBT6jA&oe=64B7326C",
    name: "Riyad Mahrez",
    message: "we have a game later, can you come?",
    sendTime: "13:39",
    isActive: false,
  ),
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/164676323_309063850578579_6478165202362006138_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFyWnFpcQYNNnYd7ZnqzbbbtWL5baxbPQu1YvltrFs9C29XweVdYF-IV2SlpCAhhjla70f59aWcKuTle9XxR9qH&_nc_ohc=-mND-CP9XAYAX9J2HxH&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfCQBj7V8toUQrwYkpyoV66gxFCP76OMUdoqcb_GZEsm6A&oe=64DA29EB",
    name: "Mohamed Salah",
    message: "That's a good advice, you're a life saver!",
    sendTime: "13:13",
    isActive: true,
  ),
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/190108336_322648402555040_2100790391455013605_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeE_38JQEs3C8ge34VzF6oyfGSpiHjKjXKQZKmIeMqNcpL2xMZ9HDVpVdRObjxO93kYiVbKRdHshCF7Om1uYzZly&_nc_ohc=KvjS7tJmdzkAX81lojp&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfD65ZLi3iunSlYylDxSM2jX0w9Eevaxshk-fmp1xBMRJA&oe=64DA1A40",
    name: "Cristiano Ronaldo",
    message: "Good Morning, are you free? I need your help",
    sendTime: "13:10",
    isActive: true,
  ),
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t1.6435-9/199385759_345470910277839_3988273979229903886_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZ_H0T9GbTSJ-bvETxpJPn_R1YrUnrs9b9HVitSeuz1vHo90XI81a86Fk0O5eaRQZWPSDDNJYcQ2SUGPvTMnfw&_nc_ohc=SBgHgPvus3gAX8jfPrg&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfCK1Z4ETKtFEqhW3QKKLa4TtUCp2WBw9isQnCIsdfAHGQ&oe=64D9F58F",
    name: "Leo Messi",
    message: "So, what's up!",
    sendTime: "13:08",
    isActive: false,
  ),
  ChatPerson(
    image:
        "https://scontent.fqsf1-1.fna.fbcdn.net/v/t39.30808-6/328251162_954776032597397_2540120982956477289_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFZZgEv89i3l3ZjINgOAjhAuk3YFhrVORW6TdgWGtU5FQjzIE-lEol0XTfeWhIE_mMG9ZSlyX2uek38SzP5GJ9E&_nc_ohc=oLVE-buNcn0AX__ix-_&_nc_ht=scontent.fqsf1-1.fna&oh=00_AfDlRtSc6_balKR5E5d2TFnv5Pfq6Q9-GMgAQGWHA97f6Q&oe=64B77740",
    name: "Alisha Lehmann",
    message: "Can we talk now, please!",
    sendTime: "12:50",
    isActive: true,
  ),
];
