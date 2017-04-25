require('rspec')
require('todo')

describe(Task) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new("bathe the cat")
      expect(test_task.description()).to(eq("bathe the cat"))
    end
  end
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("wash the lion")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
end
