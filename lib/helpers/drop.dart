// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// ​
// class CustomDropDown2<T> extends StatefulWidget {
//   final List<T> items;
//   final String? hint;
//   final double? height;
//   final T? value;
//   final bool isEnabled;
//   final bool isNormalIcon;
//   final Color? iconBgColor;
//   final bool redBorder;
//   final Border? border;
//   final T? typeInstance;
//   final String Function(T)? dropDownVal;
//   final Widget Function(T, VoidCallback)? dropDownItem;
//   final Widget? lastItem;
//   final String? selectedItem;
//   final TextStyle? hintStyle;
//   final VoidCallback? onClickLastItem;
//   final Function(T)? onSelected;
//   ​
//   const CustomDropDown2({
//     Key? key,
//     required this.items,
//     this.hint,
//     this.isNormalIcon = false,
//     this.onSelected,
//     this.dropDownItem,
//     this.height,
//     this.selectedItem,
//     this.value,
//     this.redBorder = false,
//     this.isEnabled = true,
//     this.lastItem,
//     this.iconBgColor,
//     this.hintStyle,
//     this.onClickLastItem,
//     this.dropDownVal,
//     this.typeInstance,
//     this.border,
//   }) : super(key: key);
//   ​
//   @override
//   DropDownButtonCustom2State<T> createState() =>
//       DropDownButtonCustom2State<T>();
// }
// ​
// class DropDownButtonCustom2State<T> extends State<CustomDropDown2<T>> {
//   @override
//   Widget build(BuildContext context) {
//     final length = widget.items.length + (widget.lastItem != null ? 1 : 0);
//     return IgnorePointer(
//       ignoring: !widget.isEnabled,
//       child: SizedBox(
//         height: widget.height ?? 45,
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2<T>(
//             isExpanded: true,
//             hint: widget.hint == null
//                 ? null
//                 : Text(
//               widget.hint!,
//               style: widget.hintStyle ??
//                   TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.grey.withOpacity(0.9),
//                   ),
//               overflow: TextOverflow.ellipsis,
//             ),
//             items: List.generate(
//               length,
//                   (index) {
//                 if (index == widget.items.length && widget.lastItem != null) {
//                   return DropdownMenuItem(
//                     value: widget.typeInstance,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         widget.onClickLastItem?.call();
//                       },
//                       child: widget.lastItem!,
//                     ),
//                   );
//                 }
//                 T item = widget.items[index];
//                 final value = widget.dropDownVal != null
//                     ? widget.dropDownVal!(item)
//                     : item.toString();
//                 return DropdownMenuItem<T>(
//                   value: widget.items[index],
//                   child: widget.dropDownItem != null
//                       ? InkWell(
//                     onTap: () {},
//                     child: StatefulBuilder(
//                       builder: (context, menuState) {
//                         return widget.dropDownItem!(
//                           item,
//                               () {
//                             setState(() {});
//                             menuState(() {});
//                           },
//                         );
//                       },
//                     ),
//                   )
//                       : Text(
//                     value,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 );
//               },
//             ),
//             value: widget.value,
//             onChanged: (value) {
//               if (value != null) {
//                 widget.onSelected?.call(value);
//               }
//             },
//             buttonStyleData: ButtonStyleData(
//               height: 24,
//               padding: const EdgeInsets.only(left: 5, right: 0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3),
//                 border: widget.redBorder
//                     ? Border.all(
//                   color: Colors.red,
//                 )
//                     :  widget.border ??Border.all(
//                   color: Colors.transparent,
//                 ),
//                 color: Colors.white,
//               ),
//               elevation: 0,
//             ),
//             iconStyleData: widget.isNormalIcon
//                 ? const IconStyleData(
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 size: 20,
//               ),
//             )
//                 : IconStyleData(
//               icon: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: const Icon(
//                   Icons.keyboard_arrow_down_rounded,
//                   size: 14,
//                 ),
//               ),
//               iconEnabledColor: Colors.black,
//               iconDisabledColor: Colors.grey,
//             ),
//             dropdownStyleData: DropdownStyleData(
//               maxHeight: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.withOpacity(0.3)),
//                 color: Colors.white,
//               ),
//               elevation: 0,
//               offset: const Offset(0, 0),
//               scrollbarTheme: ScrollbarThemeData(
//                 radius: const Radius.circular(40),
//                 thickness: MaterialStateProperty.all<double>(6),
//                 thumbVisibility: MaterialStateProperty.all<bool>(true),
//               ),
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               height: 25,
//               padding: EdgeInsets.only(left: 8, right: 0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }