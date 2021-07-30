//
//  Indexed.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/27/21.
//

import Foundation

// A wrapper that holds an element, its index, and offset
@dynamicMemberLookup
struct Indexed<Element, Index> {
	var index: Index
	var offset: Int
	var element: Element
	
	//Access to constant members
	  subscript<T>(dynamicMember keyPath: KeyPath<Element, T>) -> T
	  {
		 element[keyPath: keyPath]
	  }
	  
	//Access to mutable members
	  subscript<T>(dynamicMember keyPath: WritableKeyPath<Element, T>) -> T
	  {
		 get { element[keyPath: keyPath] }
		 set { element[keyPath: keyPath] = newValue }
	  }
}

// If the indexed element is Identifiable, make it so
extension Indexed: Identifiable where Element: Identifiable {
	var id: Element.ID { element.id }
}

// Return an indexed RandomAccessCollection, using the Indexed type.
// Allow access to each element on demand
extension RandomAccessCollection
{
  func indexed() -> AnyRandomAccessCollection<Indexed<Element, Index>>
  {
	 AnyRandomAccessCollection(
		zip(zip(indices, 0...).lazy, self).lazy
		  .map { Indexed(index: $0.0.0, offset: $0.0.1, element: $0.1) }
	 )
  }
}
