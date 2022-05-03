import os

f = open('missing.txt', 'r')
list_f = f.read().split('\n')
computed = os.listdir('models_manifold')

is_in = 0
is_not = 0
for id in list_f:
    if id in computed:
        is_in += 1
    else:
        print(id)
        is_not += 1

print('is_in {}'.format(is_in))
print('is_not {}'.format(is_not))
