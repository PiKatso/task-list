require('spec_helper')

describe(Task) do
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#due_date") do
    it("lets you read the due date out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      expect(test_task.due_date).to(eq('2017-05-05'))
    end
  end

  describe(".all_by_date") do
    it("returns an array of all tasks ordered by date") do
      test_task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2014-05-05'})
      test_task1.save
      test_task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2012-05-05'})
      test_task2.save
      test_task3 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      test_task3.save
      test_task4 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2018-05-05'})
      test_task4.save
      expect(Task.all_by_date).to(eq([test_task2, test_task1, test_task3, test_task4]))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-05-05'})
      expect(task1).to(eq(task2))
    end
  end
end
