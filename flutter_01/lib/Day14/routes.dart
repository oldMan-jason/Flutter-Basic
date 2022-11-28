
// var onGenerateRoute = (RouteSettings settings) {
//   final String? name = settings.name; //  /news 或者 /search
//   final Function? pageContentBuilder =
//       routes[name]; //  Function = (contxt) { return const NewsPage()}

//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       final Route route = MaterialPageRoute(
//           builder: (context) =>
//               pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route =
//           MaterialPageRoute(builder: (context) => pageContentBuilder(context));

//       return route;
//     }
//   }
//   return null;
// };
