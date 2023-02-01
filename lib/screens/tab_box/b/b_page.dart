import 'package:fifth_exam/bloc/user_cubit/user_cubit_cubit.dart';
import 'package:fifth_exam/bloc/user_cubit/user_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BPage extends StatelessWidget {
  const BPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'B Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: state is LoadUserInProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is LoadUserInSuccess
                    ? Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      state.user.results[0].picture.medium),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.user.results[0].name.first,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      state.user.results[0].name.last,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 255,
                                      child: Text(
                                        state.user.results[0].email,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "City: ${state.user.results[0].location.city}",
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "State: ${state.user.results[0].location.state}",
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Country: ${state.user.results[0].location.country}",
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Age: ${state.user.results[0].dob.age}",
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Phone number: ${state.user.results[0].phone}",
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Gender: ${state.user.results[0].gender}",
                            ),
                          ],
                        ),
                      )
                    : state is LoadUsersInFailure
                        ? Center(
                            child: Text(
                              state.errorText.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
