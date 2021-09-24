import reprlib
class Set:

    def __init__(self, components) -> None:
        self._components = components

    def __iter__(self):
        return iter(self._components)

    def __repr__(self):
        components = reprlib.repr(self._components)
        return f'Set({components})'

    def __str__(self) -> str:
        return str(tuple(self))

    def __eq__(self, o: object) -> bool:
        return tuple(self) == tuple(o)

    def __len__(self):
        return len(self._components)

    def __getitem__(self, position):
        return self._components[position]

    def is_empty(self) -> bool:
        return self.size == 0

    def size(self) -> int:
        return len(self)

    def __contains__(self, e):
        return e in self._components

    def include(self, o: object) -> bool:
        for e in o:
            if e not in self._components:
                return False
        return True

if  __name__ == '__main__':
    s = Set([1, 2, 3])
    print(s.size())
    print(s.is_empty())
    print(s[1])
    print(1 in s)
    print(s.include([3]))